% parsing script for njoy output

% preallocate arrays
ng = 70;
Elow = zeros(ng,1);
Ehi = zeros(ng,1);
Edel = zeros(ng,1);
Ldel = zeros(ng,1);
ene = zeros(ng,1);
flux = zeros(ng,1);
sigt = zeros(ng,1);
sigc = zeros(ng,1);
sigs = zeros(ng,1);
sigs0 = zeros(ng,ng);
sigs1 = zeros(ng,ng);
sigs2 = zeros(ng,ng);
sigs3 = zeros(ng,ng);

% open up file
fid = fopen('output','r');

% start loop around reading each line
line = fgetl(fid);
lnum = 1;
while (line ~= -1)
   
    % split the line
    sline = textscan(line,'%s');
    
    % check line numbers
    if and(lnum >= 35, lnum <= 104)
      
        % extract data from text
        gidx = str2double(sline{1}{1});
        gl = str2double(sline{1}{2})/1e6;
        gu = str2double(sline{1}{4})/1e6;
        
        % set in vars
        Elow(ng - gidx + 1) = gl;
        Ehi(ng - gidx + 1) = gu;
        Edel(ng - gidx + 1) = gu - gl;
        Ldel(ng - gidx + 1) = log(gu/gl);
        ene(ng - gidx + 1) = 0.5*(gu + gl);
        
    elseif and(lnum >= 129, lnum <= 268)
        
        % check if line number is even
        if (mod(lnum,2) == 0)
               
            % extract data
            flx = sline{1}{2};
            flx = regexprep(flx,'-','E-');
            flx = regexprep(flx,'+','E+');
            flx = str2double(flx);
            flux(ng - gidx + 1) = flx;
            
        else
            
            % extract data
            gidx = str2double(sline{1}{1});
            xs_t = sline{1}{2};
            xs_t = regexprep(xs_t,'-','E-');
            xs_t = regexprep(xs_t,'+','E+');
            xs_t = str2double(xs_t);
            sigt(ng - gidx + 1) = xs_t;
            
        end
        
    elseif and(lnum >= 281,lnum <= 350)
        
        % extract data
        gidx = str2double(sline{1}{1});
        xs_s =  sline{1}{2};
        xs_s = regexprep(xs_s,'-','E-');
        xs_s = regexprep(xs_s,'+','E+');
        xs_s = str2double(xs_s);
        sigs(ng - gidx + 1) = xs_s;
             
    elseif and(lnum >= 363,lnum <= 432)
        
        % extract data
        gidx = str2double(sline{1}{1});
        xs_c =  sline{1}{2};
        xs_c = regexprep(xs_c,'-','E-');
        xs_c = regexprep(xs_c,'+','E+');
        xs_c = str2double(xs_c);
        sigc(ng - gidx + 1) = xs_c;
        
    elseif and(lnum >= 502,lnum <= 2618)
        
        % extract data
        hidx = str2double(sline{1}{1});
        gidx = str2double(sline{1}{2});
        xs_s0 =  sline{1}{3};
        xs_s0 = horzcat(xs_s0(1),regexprep(xs_s0(2:length(xs_s0)),'-','E-'));
        xs_s0 = horzcat(xs_s0(1),regexprep(xs_s0(2:length(xs_s0)),'+','E+'));
        xs_s0 = str2double(xs_s0);
        sigs0(ng - hidx + 1,ng - gidx + 1) = xs_s0;
        xs_s1 =  sline{1}{4};
        xs_s1 = horzcat(xs_s1(1),regexprep(xs_s1(2:length(xs_s1)),'-','E-'));
        xs_s1 = horzcat(xs_s1(1),regexprep(xs_s1(2:length(xs_s1)),'+','E+'));
        xs_s1 = str2double(xs_s1);
        sigs1(ng - hidx + 1,ng - gidx + 1) = xs_s1;
        xs_s2 =  sline{1}{5};
        xs_s2 = horzcat(xs_s2(1),regexprep(xs_s2(2:length(xs_s2)),'-','E-'));
        xs_s2 = horzcat(xs_s2(1),regexprep(xs_s2(2:length(xs_s2)),'+','E+'));
        xs_s2 = str2double(xs_s2);
        sigs2(ng - hidx + 1,ng - gidx + 1) = xs_s2;
        xs_s3 =  sline{1}{6};
        xs_s3 = horzcat(xs_s3(1),regexprep(xs_s3(2:length(xs_s3)),'-','E-'));
        xs_s3 = horzcat(xs_s3(1),regexprep(xs_s3(2:length(xs_s3)),'+','E+'));
        xs_s3 = str2double(xs_s3);
        sigs3(ng - hidx + 1,ng - gidx + 1) = xs_s3;
        
    elseif and(lnum >= 2633,lnum <= 3992)
        
        % extract data
        hidx = str2double(sline{1}{1});
        gidx = str2double(sline{1}{2});
        xs_s0 =  sline{1}{3};
        xs_s0 = horzcat(xs_s0(1),regexprep(xs_s0(2:length(xs_s0)),'-','E-'));
        xs_s0 = horzcat(xs_s0(1),regexprep(xs_s0(2:length(xs_s0)),'+','E+'));
        xs_s0 = str2double(xs_s0);
        sigs0(ng - hidx + 1,ng - gidx + 1) = xs_s0;
        xs_s1 =  sline{1}{4};
        xs_s1 = horzcat(xs_s1(1),regexprep(xs_s1(2:length(xs_s1)),'-','E-'));
        xs_s1 = horzcat(xs_s1(1),regexprep(xs_s1(2:length(xs_s1)),'+','E+'));
        xs_s1 = str2double(xs_s1);
        sigs1(ng - hidx + 1,ng - gidx + 1) = xs_s1;
        xs_s2 =  sline{1}{5};
        xs_s2 = horzcat(xs_s2(1),regexprep(xs_s2(2:length(xs_s2)),'-','E-'));
        xs_s2 = horzcat(xs_s2(1),regexprep(xs_s2(2:length(xs_s2)),'+','E+'));
        xs_s2 = str2double(xs_s2);
        sigs2(ng - hidx + 1,ng - gidx + 1) = xs_s2;
        xs_s3 =  sline{1}{6};
        xs_s3 = horzcat(xs_s3(1),regexprep(xs_s3(2:length(xs_s3)),'-','E-'));
        xs_s3 = horzcat(xs_s3(1),regexprep(xs_s3(2:length(xs_s3)),'+','E+'));
        xs_s3 = str2double(xs_s3);
        sigs3(ng - hidx + 1,ng - gidx + 1) = xs_s3;
        
    end
    
    % get next line
    line = fgetl(fid);
    lnum = lnum + 1;
    
    % check if line is empty
    if isempty(line)
        line = 5;
    end
end

% adjust cross section for sab
sigt = sigt - sigs + sum(sigs0,2);
sigs = sum(sigs0,2);

flux = flux./Ldel;
flux = flux./max(flux);
flux = flux./Edel.*Ldel;

% save results
save('njoy','ene','Edel','Elow','Ehi','Ldel','sigc','sigs','sigt','sigs0',...
    'sigs1','sigs2','sigs3','flux');