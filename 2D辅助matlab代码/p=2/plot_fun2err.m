% plot function which is defined on the iterior dofs
% function plot_fun(p, e, t, in, ind, u) % with triangular mesh
% u1 = zeros(size(p,2), 1);
% u1(in) = u(ind);
% pdeplot(p,e,t,'xydata',u1,'zdata',u1);
% end

function mesh_u=plot_fun(geom, u)
ftsz = 14;
% require u to be a row vector
if size(u, 2) == 1
    u=u';
end

if length(u)==length(geom.p) % if u defined also on boundary 
    
elseif length(u)==sum(geom.in) % if u only defined on interior dofs
    u = u(geom.ind);
    u0 = zeros(length(geom.p), 1);
    u0(geom.in) = u;
    u = reshape(u0, size(geom.X))';
else
    error('dof of u does not match dof of mesh')
    return
end

mesh_u = u;

% surf(X, Y, u, 'EdgeColor', 'none', 'FaceColor', 'none', 'FaceAlpha', 0.9);
axis tight;
% surf(geom.X, geom.Y, u, 'Edgecolor', 'none');
% h = surf(geom.X, geom.Y, u, 'Edgecolor', 'none');
h = surf(geom.X, geom.Y, u);
colorbar;
caxis([0 2e-4])
end



% expantations 
% temp1=caxis;
% 
% ��ͼ1��zֵ��ȡֵ��Χ����colorbar��ȡֵ��Χ��ȡ����
% 
% ����ͼ2,3ʱ
% 
% ʹ��
% 
% caxis(temp1)
% 
% ���ͼ2,3��zֵ��ȡֵ��Χ��Ϊͬ1��ͬ��
% 
% Ȼ��Ը���ͬʹ��colorbar���������ˡ�
% 
% ���ͣ�matlab��zֵӳ�䵽colormap��colorbarͨ��zֵ��colormap��ӳ���ϵ���ɵģ�������Ҫ
%     ����ͬ��figure��zֵӳ����ͬ��colormap������
% 
% ���
% caxis
% 
% caxis([cmin cmax])
% 
% caxis controls the mapping of data values to the
% colormap.