grid = [20,40,80];
r_avg = 1;

for l = 1:size(grid,2)
    k = 1;
    nu = grid(1,l);
    b = double(zeros(nu,1));
    b1 = double(zeros(nu,1));
    phi = double(phi_initial(nu));
    phi_old = double(zeros(nu,nu));
    a = [0,1,0,nu*nu,-4*nu*nu,nu*nu,0,1,0,nu];
    tdm_hor = double(tridiagonal_mat(a));
    tdm_ver = double(tridiagonal_mat(a));
    a1 = [1/nu,nu];
    [W,E,N,S,P] = coefficients(a1);
    source_initial = source(nu);
    while r_avg (1,k) >(10^(-8))
        for i = 2:1:(nu-1)
            b(1,1) = double(phi(i,1));
            b(nu,1) = double(phi(i,nu));
            for j = 2:(nu-1)
                b(j,1) = double(source_initial(i,j) + N(i-1,j)*phi(i-1,j) + S(i+1,j)*phi(i+1,j));
            end
            [B,A] = res_mat(b,tdm_hor);
            phi_hor = TDM_sol(B,A);
            phi(i,:) = phi_hor(:,1).';
        end
        
        for j = 2:1:nu-1
            b1(1,1) = double(phi(1,i));
            b1(nu,1) = double(phi(nu,i));
            for i = 2:nu-1
                b1(i,1) = double(source_initial(i,j) + W(i,j-1)*phi(i,j-1) + E(i,j+1)*phi(i,j+1));
            end
            [B1,A1] = res_mat(b1,tdm_ver);
            phi_ver = TDM_sol(B1,A1);
            phi(:,i) = phi_ver(:,1);
        end
        k = k+1;
        res = double(residual(grid(1,l),source_initial, phi));                           % matrix containing the residual vector
        error_avg(1,k) = double(sqrt((1/grid(1,l))*(sum(sum((phi - phi_old).^2)))));     % average error calculation
        r_avg(1,k) = double(sqrt((1/grid(1,l))*(sum(sum(res.^2)))))                      %calculation of L2_norm
        phi_old = phi;
    end
    iterations(1,l) = k;
    lambda_max(1,l) = error_avg(1,k)/error_avg(1,k-1);
    error_avgs{l,:} = error_avg;
    r_avgs{l,:} = r_avg;
    percentage_error{l,:} = (phi - phi_initial(grid(1,l)))/(phi_initial(grid(1,l)));
end
    x1 = 1:20;
    x2 = 1:40;
    x3 = 1:80;
    y1 = 1:20;
    y2 = 1:40;
    y3 = 1:80;
    z1 = percentage_error{1,:};
    z2 = percentage_error{2,:};
    z3 = percentage_error{3,:};
    contourf(x1,y1,z1);
    hold on 
    contourf(x2,y2,z2);
    hold on
    contourf(x3,y3,z3);
    
