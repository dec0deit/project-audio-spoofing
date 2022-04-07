clc;
ap= 'C:\LA\LA\ASVspoof2019_LA_eval\flac';
audio_files=dir(fullfile(ap,'*.flac'));
nfiles=length(audio_files);
disp(nfiles);
for i=1:20000  
  try
      filename=audio_files(i).name;
      disp(filename)
      filename1=strcat('C:\LA\LA\ASVspoof2019_LA_eval\flac\',filename);
      [x,fs]=audioread(filename1);
      [coeffs,delta,deltaDelta]=gtcc(x,fs);
      %disp(coeffs+" "+deltaDelta)
      F= horzcat(coeffs,delta,deltaDelta);
      M2 = mean(F);
      dlmwrite('G_TEST_LA19_BIG_DATA.csv',M2,'delimiter',',','-append');
  catch
      disp("some error occured in some file")
  end
  i=i+1
end
disp("all done")
