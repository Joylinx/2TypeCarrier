function yd=tTypeCarrier(x,xd)
yd=(1+1e-8*x(1).*xd.*xd);
yd=x(3)+(x(2)./yd);
end
 