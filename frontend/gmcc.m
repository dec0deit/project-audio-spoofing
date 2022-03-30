clc;
ap= 'C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\testing\0PR\';
audio_files=dir(fullfile(ap,'*.wav'));
nfiles=length(audio_files);
disp(nfiles);
for i=1:nfiles  
  try
      filename=audio_files(i).name;
      filename1=strcat('C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\testing\0PR\',filename);
      [x,fs]=audioread(filename1);
      [coeffs,delta,deltaDelta]=gtcc(x,fs);
      %disp(coeffs+" "+deltaDelta)
      F= horzcat(coeffs,delta,deltaDelta);
      M2 = mean(F);
      M1= 0;
      M= horzcat(M2,M1);
      dlmwrite('G_TEST.csv',M,'delimiter',',','-append');
  catch
      disp("some error occured in some file")
  end
  i=i+1
end
ap= 'C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\testing\1PR\';
audio_files=dir(fullfile(ap,'*.wav'))
nfiles=length(audio_files);
disp(nfiles);
for i=1:nfiles  
   try
      filename=audio_files(i).name;
      filename1=strcat('C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\testing\1PR\',filename);
      [x,fs]=audioread(filename1);
      [coeffs,delta,deltaDelta]=gtcc(x,fs);
      %disp(coeffs+" "+deltaDelta)
      F= horzcat(coeffs,delta,deltaDelta);
      M2 = mean(F);
      M1= 1;
      M= horzcat(M2,M1);
      dlmwrite('G_TEST.csv',M,'delimiter',',','-append');
  catch
      disp("some error occured in some file")
  end
  i=i+1
end
ap= 'C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\testing\2PR\';
audio_files=dir(fullfile(ap,'*.wav'));
nfiles=length(audio_files);
disp(nfiles);
for i=1:nfiles  
   try
      filename=audio_files(i).name;
      filename1=strcat('C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\testing\2PR\',filename);
      [x,fs]=audioread(filename1);
      [coeffs,delta,deltaDelta]=gtcc(x,fs);
      %disp(coeffs+" "+deltaDelta)
      F= horzcat(coeffs,delta,deltaDelta);
      M2 = mean(F);
      M1= 2;
      M= horzcat(M2,M1);
      dlmwrite('G_TEST.csv',M,'delimiter',',','-append');
  catch
      disp("some error occured in some file")
  end
  i=i+1
end
disp("all done")
