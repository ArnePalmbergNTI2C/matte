require "prime"

def prime_factorizing()
  puts "Skriv in publika nyckeln 'n'"
  @n = gets.chomp.to_i
  @primes = Prime.prime_division(@n)
  prime_1 = @primes[0][0]
  prime_2 = @primes[1][0]
  @phi_n = (prime_1 - 1) * (prime_2 - 1) 
  return "Nyckeln #{@n} består av primtalen #{prime_1} och #{prime_2}"
end

def find_d()
  puts "Skriv in publika nyckeln 'e'" 
  @e = gets.chomp.to_i 
  phi_n = @phi_n
  @d = 0
  
  while @d >= 0

      if ((@e*@d) % phi_n).to_i != 1
          @d += 1

      else
        return "Den privata nyckeln 'd' är: #{@d}"
      end

  end

end

def decrypt()
  puts "Skriv in den hemliga meddelandet"
  y = gets.chomp.to_i
  x = (y**@d) % @n

end



puts prime_factorizing()

puts find_d()
