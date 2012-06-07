%function [Mol, QNMol] = RenameandKill(Cat,QNCat,U,LI)
%Input: Cat - catalog data from JPL, CDMS, or Splatalogue
%       QNCat - quantum number data from JPL, CDMS, or SPlatalogue
%       U - limit in uncertanty in MHz
%       LI - limit in log_10 intensity, should be a negative number

function [Mol,QNMol] = RenameandKill(Cat,QNCat,U,LI)

m=1;
n=1;
if(U~=0 && LI~=0)
   while(m<=length(Cat))
       if(Cat(m,2)<=U ||Cat(m,3)>=LI)
           Mol(n,:)=Cat(m,:);
           QNMol(n)=QNCat(m);
           n=n+1;
       end
       m=m+1;
   end
elseif(U~=0)
    while(m<=length(Cat))
       if(Cat(m,2)<=U)
           Mol(n,:)=Cat(m,:);
           QNMol(n)=QNCat(m);
           n=n+1;
       end
       m=m+1;
    end
elseif(LI~=0)
    while(m<=length(Cat))
       if(Cat(m,3)>=LI)
           Mol(n,:)=Cat(m,:);
           QNMol(n)=QNCat(m);
           n=n+1;
       end
       m=m+1;
    end    
end
length(Mol);


