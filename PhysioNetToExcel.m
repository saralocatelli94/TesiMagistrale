filename='apnea-ecg/a01'
f='a01'
[signal,Fs,tm]=rdsamp(filename);
[ann,anntype,subtype,chan,num,comments]=rdann(filename,'apn');
durata=length(signal)/Fs
matECG=[tm,signal];
ann=ann/100
apnData=[]
for n=1:length(anntype)
    if anntype(n)=='N'
        apnData(n)=0
    else
        apnData(n)=1
    end
end
matAPNEA=[ann,transpose(apnData)]
destdirectory = ('C:/Users/sara/Documents/5anno/TESI/DataBase_PhysioNet/ConversioneExcel');
    if ~exist(destdirectory, 'dir')
         mkdir(destdirectory);
    end
    filenameECG=strcat(destdirectory,'/',f,'ECG.csv');
    filenameAPN=strcat(destdirectory,'/',f,'APN.csv');
    csvwrite(filenameECG,matECG)
    csvwrite(filenameAPN,matAPNEA)
  
  
 