clc;
ap= 'E:\LA_TRAIN_19\bonafide\';
audio_files=dir(fullfile(ap,'*.wav'));
nfiles=length(audio_files);
disp(nfiles);
for i=1:nfiles  
  filename=audio_files(i).name;
  filename1=strcat('E:\LA_TRAIN_19\bonafide\',filename);
  [x,fs]=audioread(filename1);
  [coeffs,delta,deltaDelta,loc]=gtcc(x,fs);
  %disp(coeffs+" "+deltaDelta)
  F= horzcat(coeffs,delta,deltaDelta);
  M2 = mean(F);
  M1= 1;
  M= horzcat(M2,M1);
  dlmwrite('M_TRAIN_LA19.csv',M,'delimiter',',','-append');
  i = i+1;
end
disp("all done")
