# encoding: utf-8
require 'rspec'

require_relative '../cipher'

describe 'CaesarCipher' do

	describe 'encode' do

		it 'ciphers by offset' do
			cipher = Cipher.new
			cipher.offset = 1
			cipher.encode('a').should eql 'b'
		end
	
		it 'is a rounded cipher' do
			cipher = Cipher.new
			cipher.offset = 2
			cipher.encode('z').should eql 'b'
		end

		it 'lowers capital letters' do
			cipher = Cipher.new
			cipher.offset = 2
			cipher.encode('A').should eql 'c'
		end

		it 'ignores numbers and symbols' do
			cipher = Cipher.new
			cipher.offset = 2
			cipher.encode('1').should eql '1'
			cipher.encode(',').should eql ','
			cipher.encode('@').should eql '@'
		end

		it 'can cipher several letters together' do
			cipher = Cipher.new
			cipher.offset = 1
			cipher.encode('ABC').should eql 'bcd'
		end

		it 'can cipher any text' do
			cipher = Cipher.new
			cipher.offset = 3
			cipher.encode('Any text form by several words!').should eql 'dqb whaw irup eb vhyhudo zrugv!'
		end

	end

	describe 'decode' do
		it 'ciphers by offset' do
			cipher = Cipher.new
			cipher.offset = 1
			cipher.decode('b').should eql 'a'
		end
	
		it 'is a rounded cipher' do
			cipher = Cipher.new
			cipher.offset = 2
			cipher.decode('b').should eql 'z'
		end

		it 'lowers capital letters' do
			cipher = Cipher.new
			cipher.offset = 2
			cipher.decode('C').should eql 'a'
		end

		it 'ignores numbers and symbols' do
			cipher = Cipher.new
			cipher.offset = 2
			cipher.decode('1').should eql '1'
			cipher.decode(',').should eql ','
			cipher.decode('@').should eql '@'
		end

		it 'can decode several letters together' do
			cipher = Cipher.new
			cipher.offset = 1
			cipher.decode('BCD').should eql 'abc'
		end

		it 'can decode any text' do
			cipher = Cipher.new
			cipher.offset = 3
			cipher.decode('dqb whaw irup eb vhyhudo zrugv!').should eql 'any text form by several words!'
		end
	end
end

describe 'Acceptance Test' do
	it 'ciphers user text' do 
		cipher = Cipher.new
		cipher.offset = 3
		cipher.encode('¿De dónde vengo? ¿A dónde voy? ¿Cuánto tiempo tengo?').should eql '¿gh góqgh yhqjr? ¿d góqgh yrb? ¿fxáqwr wlhpsr whqjr?'
	
	end
end