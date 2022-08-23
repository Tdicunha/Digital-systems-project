library ieee;
use 	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;

entity detectPosition is
	port (
		escreveLinha, escreveColuna : out std_logic_vector(9 downto 0);
		endOf		: out std_logic;
		escrever	: in std_logic;
		enter		: in std_logic;
		backspace	: in std_logic;
		clear		: in std_logic
 	) ;
end detectPosition;

architecture behavior of detectPosition is
	signal linhaCursor	: std_logic_vector(9 downto 0):= b"0000000000";
	--size of each letter on charROM
	signal tamanhoLetra : std_logic_vector (9 downto 0):= b"0000100000"; 
	signal colunaCursor	: std_logic_vector(9 downto 0):= b"0000000000";
begin
	process (escrever)
	begin
		if (escrever'EVENT and escrever='1') then 
			endOf <= '0';
			--when the user clicks on backspace
			if (backspace = '1' and enter = '0') then 
				if (colunaCursor = b"0000000000" and linhaCursor > b"0000000000") then 
					colunaCursor <= b"1010000000" - tamanhoLetra; 
					linhaCursor <= linhaCursor - tamanhoLetra;
				elsif (linhaCursor = b"0000000000" and colunaCursor = b"0000000000") then
					endOf <= '1';
				else
					colunaCursor <= colunaCursor - tamanhoLetra;
				end if;
			--when the user clicks on enter
			elsif (enter = '1' and (linhaCursor + tamanhoLetra < b"1111000000") and backspace = '0') then
				if (linhaCursor > b"0111100000" - tamanhoLetra or linhaCursor = b"0111100000" - tamanhoLetra) then
					endOf <= '1';
				else
					linhaCursor <= linhaCursor + tamanhoLetra;
					colunaCursor <= b"0000000000";
				end if;
			end if;
			if (backspace = '0' and enter ='0')then
				--when there's space in the line
				if (colunaCursor < b"1010000000" - tamanhoLetra) then
					colunaCursor <= colunaCursor + tamanhoLetra;
				--when there's no more space in the current line, but a next line is available
				elsif (linhaCursor < b"0111100000" - tamanhoLetra) then
					colunaCursor <= b"0000000000";
					linhaCursor <= linhaCursor + tamanhoLetra;
				--when there's no next line
				else												
					endOf <= '1';
				end if;
			end if;
		end if;
		--total clear
		if (clear = '1') then
			linhaCursor <= b"0000000000";
			colunaCursor <= b"0000000000";
		end if;
		escreveLinha <= linhaCursor;
		escreveColuna <= colunaCursor;
	end process;
end behavior;