module Utils
    module_function
    
    def shift_char(char, shift)
        base = 
            case char
            when 'a'..'z' then 'a'.ord
            when 'A'..'Z' then 'A'.ord
            else return char
            end

        offset = (char.ord - base + shift) % 26
        (base + offset).chr
    end

end