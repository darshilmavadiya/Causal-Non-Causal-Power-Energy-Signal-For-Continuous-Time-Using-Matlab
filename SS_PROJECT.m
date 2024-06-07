clc;
close all;
clear all ;
while true
    
    a=input('Enter "C" for causal and "E" for energy power and "Q" for quit','s');
     
    if a=='C'
    
                k =2;
                n= 0:2+k;
                x=[10 2 5 zeros(1,k)];
                subplot(4,1,1)
                stem(n,x);
                xdelay=[zeros(1,k) x(1:3)];
                subplot(4,1,2);
                stem(n,xdelay);
                y=x+n.*xdelay;
                nk=(0:length(n)-1+k)-k;
                ydelayed=[xdelay zeros(1,k)]+nk.*[zeros(1,k) xdelay]
                subplot(4,1,3);
                stem(0:length(ydelayed)-1,ydelayed)
                n1=(0:length(n)-1+k);
                ydin=[xdelay zeros(1,k)]+n1.*[zeros(1,k) xdelay]
                subplot(4,1,4)
                stem(0:length(ydin)-1,ydin)

    elseif a == 'E'
                       syms m;
                        A = input('Enter Amplitude =');
                        f=input('Enter frequency =');
                        fs=input('Enter sampling frequency =');
                        fo=f/fs;
                        T=1/f;
                        C=input('Enter INITIAL TIME =');
                        D=input('Enter TIME GAP =');
                        E=input('Enter FINAL TIME =');
                        t=linspace(C,D,E);
                        w=2*pi*fo;
                        theta = input('Enter phase in radian = ');          
        
                                v = A* sin(w*t + theta);
                                 k = A* sin(w*m + theta);
                                 v2=k.^2;
                                energy=int(v2,m,-inf,inf);
                                disp(energy);
                                if energy == inf
                                disp(' The signal is not energy signal');
                                end
                                power = limit((int(v2,m,-m/2,m/2))/m,m,inf);
                                disp(power);
                                if power == inf
                                disp(' The signal is not power signal');
                                end
                                
    elseif a== 'Q'
        break
    else
        disp('Wrong choice');
        break
        
    end
end