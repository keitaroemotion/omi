module Lib
    class Find 
        class << self
            require "json"
            def secondary_api_call(script_body, skey, api, prefix, value, host)
                puts
                if api == "card"
                    puts api
                    cmd = "curl -s -X GET #{host}/customers/#{value}/cards -u #{skey}"
                else    
                    cmd = "curl -s -X GET #{host}/#{api}s -u #{skey}"
                end
                puts "[Secondary Command Call]: #{cmd.cyan}"
                result = `#{cmd}`
                if result.include?("authentication failed")
                    abort("\n\nauthentication failure: #{cmd}\n\n")
                end
                JSON.parse(result).to_h
            end

            #
            # XXX at this point this filter does eliminate status: deleted
            #     record but in the near future this should be optional
            #
            def fit_map(result, prefix, is_data=true)
                result["data"]
                  .select { |a| a["status"] != "deleted" }
                  .map {|a| a.to_s.gsub(/=>/, ": ") }
                  .map {|a| a.to_s.gsub(/(#{prefix}[^"]+)/, "\\1".blue) }
                  .map {|a| a.to_s.gsub(/([^{}:\s]+:)/, "\\1".magenta) }
                  .map {|a| a.to_s.gsub(/"/, "") }
            end

            #
            # XXX needs to be refactored
            #
            # if specific parameter is missing, this script enlist the
            # existing values, then, let user choose the one,
            # and eventually this value is assigned to the main script_body
            #
            def fit(script_body, skey, api, prefix, options, host, value="")
                if script_body.include?("$#{api}") 
                    list = secondary_api_call(script_body, skey, api, prefix, value, host)
                    if api == "customer" && options["customer"]
                        value = options["customer"]
                    else
                        if list["data"].size == 0
                            abort("[#{api}]:               No record")
                        elsif list["data"].size == 1    
                            value = list["data"][0]["id"]
                        else  
                            fit_map(list, prefix).each_with_index { |e, i| puts "[#{i}] #{e}\n"; puts }
                            print "\n[which?][q:Quit] "    
                            input = $stdin.gets.chomp
                            abort if input.downcase == "q"
                            value = list["data"][input.to_i]["id"]
                        end
                    end    
                    script_body = script_body.gsub("$#{api}", value)
                end
                [script_body, value]
            end
        end
    end
end    
