class Cipher
	attr_accessor :offset
	ENCODE_DIRECTION = 1
	DECODE_DIRECTION = -1
	
	def initalize
		@offset = 0
	end

	def encode(text)
		cipher(text, ENCODE_DIRECTION)		
	end

	def decode(text)
		cipher(text, DECODE_DIRECTION)
	end

private
	
	def cipher(text, direction)
		text.chars.map { |character| cipher_character(character, direction) }.join
	end

	def cipher_character(character, direction)
		return character unless Alphabet.has_character?(character)
		Alphabet.next_character(character, offset * direction)
	end	

	class Alphabet
		ALPHABET =  %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
		ALPHABET_SIZE = ALPHABET.size()
		
		def self.has_character?(character)
			return !ALPHABET.index(character.downcase).nil?
		end

		def self.next_character(character, offset)
			position = ALPHABET.index(character.downcase)
			new_position = (position + offset) % ALPHABET_SIZE
			return ALPHABET[new_position] 
		end
	end
end

