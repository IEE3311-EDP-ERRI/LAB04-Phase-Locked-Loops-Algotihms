%angulo del eje rotatorio dq
syms th
%angulo temporal tensiones abc/abg
syms wt Vp Vn  
%angulo desfase entre sec postiva y neg. Depende del nivel de desbalance
syms fi

%contante Fortscue.
a=exp(i*2*pi/3);

%Transformada Clarke alfa, beta, zero reference.
T_abc_abg = 2/3*[1 -1/2 -1/2;0 sqrt(3)/2 -sqrt(3)/2;1/2 1/2 1/2];
%Transf Park dq0 references.
T_abg_dq0=[cos(th) sin(th) 0;-sin(th) cos(th) 0; 0 0 1];
T_abg_dq0_neg=[cos(-th) sin(-th) 0;-sin(-th) cos(-th) 0; 0 0 1];
%Transf Fortscue Positive, ngative and zero seccuence.
T_pn0_abc=[1 1 1; 1 a^2 a; 1 a a^2];
T_abc_pn0=1/3*[1 1 1; 1 a a^2; 1 a^2 a];

vap=Vp*cos(wt);
vbp=Vp*cos(wt-2*pi/3);
vcp=Vp*cos(wt+2*pi/3);

van=Vn*cos(wt-fi);
vbn=Vn*cos(wt+2*pi/3-fi);
vcn=Vn*cos(wt-2*pi/3-fi);

Vp=[vap;vbp;vcp];
Vn=[van;vbn;vcn];
V=Vp+Vn;

Vabg=simplify(T_abc_abg*V);
Vdq0=simplify(T_abg_dq0*Vabg)
Vdq0_neg=simplify(T_abg_dq0_neg*Vabg)
