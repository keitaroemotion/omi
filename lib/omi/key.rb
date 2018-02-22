module Lib
    class Key
        class << self
            def config(config_path, has_equal)
                lines = File
                    .open(config_path, "r")
                    .each_line
                    .to_a
                    .select { |a| a =~ has_equal } 
                lines.map{ |line| line.split("=").map(&:chomp) }.flatten
            end
            
            def config_hash(config_path, has_equal)
                File.exist?(config_path) || abort("config file missing")
                Hash[*(config(config_path, has_equal))]
            end

            def fill_key(keys, sym, key)
                if keys[sym] != "" 
                    key = automate_key(keys, sym)
                    puts "key substitution: #{key}"
                end
                key
            end

            def skey(keys, config_hash)
                fill_key(keys, :skey, config_hash["skey"])
            end

            def pkey(keys, config_hash)
                fill_key(keys, :pkey, config_hash["pkey"])
            end

            def automate_key(keys, sym)
                /[^\:]$/ =~ keys[sym] ? keys[sym] + ":" : keys[sym]
            end

            def get_keys(argv)
                keys = argv.select {|a| /[ps]key_[\d\w\_\:]+/ =~ a }
                if keys.size > 0
                    return {
                        pkey: (keys.select{|a| /pkey/ =~ a }.first.to_s.strip.chomp),
                        skey: (keys.select{|a| /skey/ =~ a }.first.to_s.strip.chomp)
                    }  
                end
                return {pkey: "", skey: ""}
            end
        end
    end
end    
