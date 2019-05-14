clc;
clear all;
close all;

%file pesan rahasia
pesan = fileread('test.txt');
%jika panjang pesan > 20 maka yang diambil hanya 20 karakter saja
%if length(pesan) > 20, pesan = pesan(1:20), end;
%pesan teks dijadikan angka
pesan = uint8(pesan);
%hitung panjang pesan
panjang_pesan = length(pesan);

%baca citra penampung
citra= imread('D:\Octave\Image\absam.png');
%jika citra penampung RGB maka ubah dulu menjadi grayscale
if size(citra,3)==3
	citra=rgb2gray(citra);
end
%ambil nilai baris dan kolom
[baris, kolom]=size(citra);
%matriks citra dijadikan 1 baris simpan ke dalam stego
stego=citra(:);

%convert pesan menjadi biner
bit_pesan=[];
for i=1:panjang_pesan
	biner=dec2bin(pesan(i),8);
	bit_pesan = [bit_pesan biner];
end
%ambil nilai panjang bit pesan
panjang_bit_pesan = length(bit_pesan);

%proses penyisipan pesan
for i=1:panjang_bit_pesan
	%jika nilai piksel genap dan bit pesan = 1
	if(mod(stego(i), 2)==0) && (bit_pesan(i)=='1')
		%ubah nilai stego
		stego(i)=stego(i)+1;
	end
	%jika nilai piksel ganji dan bit pesan = 0
	if(mod(stego(i), 2)==1) && (bit_pesan(i)=='0')
		%ubah nilai stego
		stego(i)=stego(i)-1;
	end
end
%membentuk stego image berdasarkan proses pada variabel 'stego'
stego=reshape(stego,[baris,kolom]);
%tampilkan cover image dan stego image
%figure(1); imshow(citra), title('Cover Image');
figure(2); imshow(stego), title('Stego Image');
imwrite(stego,'hanyastegoimage.png')