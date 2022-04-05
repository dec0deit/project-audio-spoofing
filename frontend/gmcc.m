clc;
ap= 'E:\Eval2019\spoof\';
audio_files=dir(fullfile(ap,'*.flac'));
nfiles=length(audio_files);
disp(nfiles);
for i=1:nfiles  
  try
      filename=audio_files(i).name;
      filename1=strcat('E:\Eval2019\spoof\',filename);
      [x,fs]=audioread(filename1);
      [coeffs,delta,deltaDelta]=gtcc(x,fs);
      %disp(coeffs+" "+deltaDelta)
      F= horzcat(coeffs,delta,deltaDelta);
      M2 = mean(F);
      M1= 0;
      M= horzcat(M2,M1);
      dlmwrite('G_TEST_LA19.csv',M,'delimiter',',','-append');
  catch
      disp("some error occured in some file")
  end
  i=i+1
end
disp("all done")
