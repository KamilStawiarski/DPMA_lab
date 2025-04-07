function angleDetEstimated=BeamConv(Y)
    [M,N]=size(Y);
    R=Y*Y'/N;
    PCONV=@(x)(-abs(a(x,M)'*R*a(x,M)/(a(x,M)'*a(x,M))/M));

%    angleVec=[-45:0.1:45];
%    pval=zeros(size(angleVec));
%    for k=1:length(angleVec)
%        pval(k)=PCONV(angleVec(k));
%    end
%    figure
%    plot(angleVec,pval);

    % fminsearch can give incorrect results when starting point is in nearby local extremum
    angleDetEstimated=fminsearch(PCONV,0);
end
