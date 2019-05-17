
for i=1:41
yB=yData(:,i);
yB=yB+0.01*(yB==0);
zB=zData(:,i);
figure()
plot(yB,zB);
xlabel('B/mT');
ylabel('I/uA');
title(num2str(i));
end

% µç×èÄâºÏ
Xfitfeature3=zeros(41,3);
for i=1:41
yB=yData(:,i);
zB=1./zData(:,i);
options = optimoptions('lsqcurvefit','MaxFunctionEvaluations',1e4,'MaxIterations',1e4,'FunctionTolerance',1e-10);
xfit=lsqcurvefit(@tTypeCarrier,[15 5 5],yB',zB',[],[],options);
Xfitfeature3(i,:)=xfit;
Xfit=tTypeCarrier(xfit,yB);
figure()
plot(yB,zB);
xlabel('B/mT');
ylabel('I^-1/uA^-1');
hold on;
plot(yB,Xfit);
xlabel('B/mT');
ylabel('I^-1/uA^-1');
hold off;
title(num2str(i));
end
