function b = bspline( x,L )
    b = zeros(size(x));
    if L == 1
        b(abs(x) < 1) = 1-abs(x(abs(x) < 1));
    elseif L == 2
        b(abs(x) < 0.5) = -x(abs(x) < 0.5).^2 + 0.75;
        b(abs(x)>=0.5 & abs(x)<3/2) = 0.5*(abs(x(abs(x)>=0.5 & abs(x)<3/2))-1.5).^2;
    elseif L == 3
        b(abs(x) < 1) = 2/3 - abs(x(abs(x) < 1)).^2 + (1/2)*abs(x(abs(x) < 1)).^3;
        b(abs(x)>=1 & abs(x)<2) = (1/6)*(2-abs(x(abs(x)>=1 & abs(x)<2))).*(2-abs(x(abs(x)>=1 & abs(x)<2))).*(2-abs(x(abs(x)>=1 & abs(x)<2)));
    elseif L == 4
        ax1 = x(abs(x) < 0.5);
        ax2 = x(abs(x)>=0.5 & abs(x)<1.5);
        ax3 = x(abs(x)>=1.5 & abs(x)<2.5);
        b(abs(x) < 0.5) = (1/24)*(6*ax1.^4 - 15*ax1.^2 + 14.375);
        b(abs(x)>=0.5 & abs(x)<1.5) = (1/24)*(-4*ax2.^4 + 20*abs(ax2).^3 - 30*ax2.^2 + 5*abs(ax2) + 13.75);
        b(abs(x)>=1.5 & abs(x)<2.5) = (1/24)*(ax3.^4 - 10*abs(ax3).^3 + 37.5*ax3.^2 - 62.5*abs(ax3) + 39.0625);
    end
end