require 'prime'

def public_key()

    n = n()
    phi_n = phi_n(n)
    e = find_e(phi_n)
    @n = n[2]
    @e = e
    @phi_n = phi_n
    publicc_key = publicc(e,(n[2]))
    return publicc_key
    
end

def n()

    system("cls")
    puts "bestäm primtal 1"
    prime_number_1 = gets.chomp.to_i

    #prime?
    puts "Bestäm primtal 2"
    prime_number_2 = gets.chomp.to_i
    #prime
    n = prime_number_1*prime_number_2
    arr = [prime_number_1, prime_number_2, n]
    system("cls")
    return arr
    
end

def phi_n(n)
    phi_n = (n[0] - 1) * (n[1] - 1) 
    return phi_n 
end

def find_e(phi_n)

    i = 2

    while i < phi_n

        if i.gcd(phi_n) == 1 

            return i

        end

        i += 1

    end 

end

def publicc(e,n)

    arr = []

    arr << e
    arr << n

    return arr

end

puts "Publik nyckel = #{public_key()}"

def private_key()


    private_key = find_d(@e, @phi_n, @n)
    @d = find_d(@e, @phi_n, @n)[0]
    return private_key

end

def find_d(e, phi_n, n)

    arr = []
    d = 0
    i = 0
    
    while d >= 0

        if ((e*d) % phi_n).to_i != 1
            d += 1

        else

            arr << d 
            arr << n

            return arr
        end

    end

end

def encrypt()
    puts "Bestäm meddelande"
    x = gets.chomp.to_i
    y = ((x**@e) % @n).to_i 
    
    return "Krypterat meddelande: #{y}"
end

def decrypt()
    puts "Skriv den krypterade meddelandet"
    y = gets.chomp.to_i
    x = ((y**@d) % @n).to_i
    return "Dekrypterat meddelande: #{x}"
end


puts "Privat nyckel = #{private_key()}"

puts encrypt()