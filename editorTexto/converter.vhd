library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;

entity converter is
	port (
		inputTeclado		: in std_logic_vector(7 downto 0);
		clock				: in std_logic;
		characterConverted	: out std_logic_vector(5 downto 0);
		backspace			: out std_logic;
		escrever			: out std_logic;
		enter				: out std_logic
 	) ;
end converter;
architecture behavior of converter is
		signal charFromKeyboard : std_logic_vector(7 downto 0);
begin
	process (clock)
	begin
	if rising_edge(clock) then
		escrever <='0';
		charFromKeyboard <= inputTeclado;
		case charFromKeyboard is
			when b"01100110" => characterConverted <= b"000000"; --BACKSPACE
			escrever <= '1';
			when b"01011010" => characterConverted <= b"000000"; --ENTER
			escrever <= '1';
			when b"00101001" => characterConverted <= b"000000"; --SPACE
			escrever <='1';
			---------------------------------------------------------------------
			when b"00011100" => characterConverted <= b"000001"; --A
			escrever <= '1';
			when b"00110010" => characterConverted <= b"000010"; --B
			escrever <= '1';
			when b"00100001" => characterConverted <= b"000011"; --C
			escrever <= '1';
			when b"00100011" => characterConverted <= b"000100"; --D
			escrever <= '1';
			when b"00100100" => characterConverted <= b"000101"; --E
			escrever <= '1';
			when b"00101011" => characterConverted <= b"000110"; --F
			escrever <= '1';
			when b"00110100" => characterConverted <= b"000111"; --G
			escrever <= '1';
			when b"00110011" => characterConverted <= b"001000"; --H
			escrever <= '1';
			when b"01000011" => characterConverted <= b"001001"; --I
			escrever <= '1';
			when b"00111011" => characterConverted <= b"001010"; --J
			escrever <= '1';
			when b"01000010" => characterConverted <= b"001011"; --K
			escrever <= '1';
			when b"01001011" => characterConverted <= b"001100"; --L
			escrever <= '1';
			when b"00111010" => characterConverted <= b"001101"; --M
			escrever <= '1';
			when b"00110001" => characterConverted <= b"001110"; --N
			escrever <= '1';
			when b"01000100" => characterConverted <= b"001111"; --O
			escrever <= '1';
			when b"01001101" => characterConverted <= b"010000"; --P
			escrever <= '1';
			when b"00010101" => characterConverted <= b"010001"; --Q
			escrever <= '1';
			when b"00101101" => characterConverted <= b"010010"; --R
			escrever <= '1';
			when b"00011011" => characterConverted <= b"010011"; --S
			escrever <= '1';
			when b"00101100" => characterConverted <= b"010100"; --T
			escrever <= '1';
			when b"00111100" => characterConverted <= b"010101"; --U
			escrever <= '1';
			when b"00101010" => characterConverted <= b"010110"; --V
			escrever <= '1';
			when b"00011101" => characterConverted <= b"010111"; --W
			escrever <= '1';
			when b"00100010" => characterConverted <= b"011000"; --X
			escrever <= '1';
			when b"00110101" => characterConverted <= b"011001"; --Y
			escrever <= '1';
			when b"00011010" => characterConverted <= b"011010"; --Z
			escrever <= '1';
			--------------------------------------------------------------
			when b"00010110" => characterConverted <= b"110001"; --1
			escrever <= '1';
			when b"00011110" => characterConverted <= b"110010"; --2
			escrever <= '1';
			when b"00100110" => characterConverted <= b"110011"; --3
			escrever <= '1';
			when b"00100101" => characterConverted <= b"110100"; --4
			escrever <= '1';  
			when b"00101110" => characterConverted <= b"110101"; --5
			escrever <= '1';
			when b"00110110" => characterConverted <= b"110110"; --6
			escrever <= '1'; 
			when b"00111101" => characterConverted <= b"110111"; --7
			escrever <= '1';
			when b"00111110" => characterConverted <= b"111000"; --8
			escrever <= '1';
			when b"01000110" => characterConverted <= b"111001"; --9
			escrever <= '1';
			when b"01000101" => characterConverted <= b"110000"; --0
			escrever <= '1';
			
			when others => characterConverted <= b"100010";
			escrever <= '0';
		end case;
		--if Backspace then put backspace output = 1
		if charFromKeyboard = b"01100110" then 
			backspace <= '1';
		else
			backspace <= '0';
		end if;
		--if enter then put enter output = 1
		if charFromKeyboard = b"01011010" then
			enter <= '1';
		else
			enter <= '0';
		end if;
	end if;
	end process;
end behavior;
				