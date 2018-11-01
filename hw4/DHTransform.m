function T = DHTransform(theta, d, alpha, a)
    % This function returns the homeogenous transform for a set of
    % Denavit-Hartenberg parameters:
    %     theta - the rotation about the z_(i-1) axis     (RADS)
    %       d   - the translation about the z_(i-1) axis
    %     alpha - the rotation about the x'_i axis        (RADS)
    %       a   - the translation about the x'_i axis
    
    %Check inputs
    salpha = sin(alpha);
    calpha = cos(alpha);
    ctheta = cos(theta);
    stheta = sin(theta);
    if isfloat(salpha)
        if abs(salpha) < eps
            salpha = 0;
        end
    end
    if isfloat(calpha)
        if abs(calpha) < eps
            calpha = 0;
        end
    end
    if isfloat(ctheta)
        if abs(ctheta) < eps
            ctheta = 0;
        end
    end
    if isfloat(stheta)
        if abs(stheta) < eps
            stheta = 0;
        end
    end
    if isfloat(a)
        if abs(a) < eps
            a = 0;
        end
    end
    if isfloat(d)
        if abs(d) < eps
            d = 0;
        end
    end
        
    
    T = [ctheta, -stheta*calpha,  stheta*salpha, a*ctheta;
         stheta,  ctheta*calpha, -ctheta*salpha, a*stheta;
              0,         salpha,         calpha,        d;
              0,              0,              0,        1];
end