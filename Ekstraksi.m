%proses ekstrasi pesan
stego = imread('hanyastegoimage.png');
stego=stego(:);
panjang_bit_pesan = 800;
bit_pesan=[];
for i=1:panjang_bit_pesan
	%jika piksel stego genap maka bit pesan = 0
	if mod(stego(i),2)==0,bit_pesan=[bit_pesan '0'];
	end;
	%jika piksel stego ganjil maka bit pesan = 1
	if mod(stego(i),2)==1,bit_pesan=[bit_pesan '1'];
	end;
end
pesan=[];
%susun nilai biner menjadi 8 bit
for i=1:8:panjang_bit_pesan
	%ubah nilai biner menjadi desimal
	desimal=bin2dec(bit_pesan(i:i+7));
	%ubah nilai desimal ke dalam bentuk karakter
	pesan=[pesan char(desimal)];
end
%tampiilkan pesan rahasia yang sudah diekstraksi
disp(['Hasil Ekstrasi Pesan = ',pesan]);

%Tugas pesan disimpan dalam format text
%proses penyisipan dan ekstrasi dipisah
%gambar stego image otomatis