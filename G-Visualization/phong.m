function out = phong(vol)
    kd = 1;
    Md = 1;
    Id = 1;
    [xgrad, ygrad, zgrad] = grad_xy(vol);
    angl = ygrad/(xgrad^2+ ygrad^2+ zgrad^2);
    
    out = angl*kd*Md*Id;


end