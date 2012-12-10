class Cipher
	attr_accessor :offset
	ENCODE_DIRECTION = 1
	DECODE_DIRECTION = -1
	
	def initalize
		@offset = 0
	end

	def encode(text)
		text.chars.map { |character| encode_character(character) }.join
	end

	def encode_character(character)
		return character if !Alphabet.hasCharacter?(character)
		Alphabet.getFromOffset(character, offset * ENCODE_DIRECTION)
	end

	def decode(text)
		text.chars.map { |character| decode_character(character) }.join
	end

	def decode_character(character)
		return character if !Alphabet.hasCharacter?(character)
		Alphabet.getFromOffset(character, offset * DECODE_DIRECTION)
	end


	class Alphabet
		ALPHABET =  %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}
		ALPHABET_SIZE = ALPHABET.size()
		
		def self.hasCharacter?(character)
			return !ALPHABET.index(character.downcase).nil?
		end

		def self.getFromOffset(character, offset)
			position = ALPHABET.index(character.downcase)
			new_position = (position + offset) % ALPHABET_SIZE
			return ALPHABET[new_position] 
		end
	end
end

