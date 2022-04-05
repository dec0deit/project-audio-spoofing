clc;
addpath('CQT_toolbox_2013');
ap= 'C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\training\0PR\';
audio_files=dir(fullfile(ap,'*.wav'));
nfiles=length(audio_files);
disp(nfiles);
for i=1:10  
  filename=audio_files(i).name;
  filename1=strcat('C:\Users\singl\Downloads\Audio-Classification\Replay-Recordings\training\0PR\',filename);
  [x,fs]=audioread(filename1);
  B = 96;
  fmax = fs/2;
  fmin = fmax/2^9;
  d = 16;
  cf = 19;
  ZsdD = 'ZsdD';
  CQcc = cqcc(x, fs, B, fmax, fmin, d, cf, ZsdD);
  %disp(coeffs+" "+F+" "+CQcc+" "+cqt) 
  M2 = CQcc;
  M1= 0;    
  M= horzcat(M2,M1);
  dlmwrite('C_TRAIN_VSDC.csv',M,'delimiter',',','-append');
  i=i+1
end

