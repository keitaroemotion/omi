require "colorize"

module Lib
  class Scenario
    class << self 
      #
      # [ITERATION]
      # $schd: omi schedule delete schedule=$
      #
      
      def get_pkey
        key = ARGV.select{ |a| a.start_with?("pkey_") }.first 
        key
      end
      
      def get_skey
        key = ARGV.select{ |a| a.start_with?("skey_") }.first 
        key
      end

      def all_scenarios
        Dir["/usr/local/etc/omi/scenario/*"]
      end

      def choose_scenario(scenarios)
        if scenarios.size == 1
          return scenarios[0]
        end

        puts
        scenarios.each_with_index do |s, i|
          puts "[#{i}] #{File.basename(s)}"
        end
        puts
        print("[q: quit e\\s\\d+: edit n: new] ")
        input = $stdin.gets.chomp
        if input == "n"
          print "[New Scenario Name]: "
          file = "/usr/local/etc/omi/scenario/" + $stdin.gets.chomp + ".story"
          system "vim #{file}"
          choose_scenario(scenarios)
        elsif /^e\s+\d+$/ =~ input
          index = /\d+/.match(input).to_s.strip.to_i
          if scenarios.size > index
            file = scenarios[index]
            system "vim #{file}"
          else
            puts "Index is Out of Range".red
          end
          choose_scenario(scenarios)
        elsif /^\d+$/ =~ input
          scenarios[input.to_i]
        elsif input == "q"
          abort
        else
          regex = Regexp.new(input.gsub(" ", ".+"))
          scenarios = scenarios.select{|s| regex =~ s}
          choose_scenario(scenarios.empty? ? all_scenarios : scenarios)
        end
      end

      def get_story_path
        choose_scenario(all_scenarios)
      end
      
      def process_echo(instruction)
        if instruction.start_with?("echo ")
          puts("\n---------------------------------------------------\n\n") 
          puts(instruction.gsub("echo ", "").chomp.blue)
          puts("\n---------------------------------------------------") 
        end
      end
      
      def process_loop_omi(instruction, hash, result)
        if /\$.+\:\s+omi\s+.+/ =~ instruction
          prefix = /\$[^\:]+/.match(instruction).to_s
          value = hash[prefix]
          instruction = instruction.gsub("#{prefix}:", "").strip
      
          if value.class == String
            value = [value]
          end
      
          value.each do |x|
            command = instruction.gsub("$", x)
            puts command
            system command
          end
        end
      end
    
      def assert(instruction, result)
        if instruction.start_with?("assert ")
          regex = Regexp.new(instruction.gsub("assert ", "").strip.gsub(" ", ".+"))
          print("ASSERT #{regex.to_s}: [")
          if regex =~ result
            print("OK".green)
          else  
            print("NG".red)
          end
          puts("]")
        end  
      end

      def process_shell(instruction)
        if instruction.start_with?("shell:")
          system instruction.gsub("shell:", "")
        end
      end

      def process_omi(instruction, hash, result)
        ask = true
        if instruction.start_with?("omi ")

          if instruction.include?("--no-ask")
            instruction = instruction.gsub("--no-ask", "")
            ask         = false
          end
          hash.each do |k, v|
            unless k.strip.include?(" ")
              return result if v.class == Array
              instruction = instruction.gsub(k, v)
            end 
          end  

          if ask
            print(instruction.chomp)
            print(" [Y/n]: ")
            input = $stdin.gets.chomp.downcase
            abort if input == "n"
          end  
          result = `#{instruction}`.split("[Result]")
          command  = result[0]
          response = result[1]
          puts command
          print("[response]> ")
          if ask
             $stdin.gets.chomp
          end
          puts(response)
          result = response
        end
        result
      end
      
      def assign(instruction, result, hash)
        if /\$.+=.+/ =~ instruction
          isp      = instruction.split("=").map{ |x| x.strip.chomp }
          variable = isp[0] 
          regex    = Regexp.new(isp[1].gsub("_", "\\_") + "[^\"\/]+")
          if /{.+}/ =~ variable
            variable = variable.gsub("{", "").gsub("}", "")        
            match = result
              .split("\n")
              .select { |line| regex =~ line }
              .map    { |line| regex.match(line).to_s }
              .uniq
          else  
            match = regex.match(result).to_s
          end
          hash[variable] = match
          puts "ASSIGNED: #{variable} => #{match}"
        end
        hash
      end
      
      def execute(story_path=get_story_path)
        result = ""
        hash   = {}
        
        File.open(story_path, "r").each do |instruction|
          if instruction.strip == "abort"
            abort
          end
          if !(instruction.start_with?("#") && instruction.strip.chomp)
            process_shell(instruction)
            process_echo(instruction)
            result = process_omi(instruction, hash, result)
            hash   = assign(instruction, result, hash)
            assert(instruction, result)
            process_loop_omi(instruction, hash, result)
          end
        end 
        puts "\n[Scenario Completed]\n".magenta
        execute
      end  
    end  
  end  
end
