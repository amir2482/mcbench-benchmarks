function [hh,prev_scale]=d_ga(h,G,prev_scale,len)
% ������������� �������� ��������� �������� �������
% ������� ����������:
%	h          - ������� ������
%	G          - �������� ��������
%   prev_scale - ���������� ���������� �����������
%   len        - ����� �������� � �������
% �������� ����������: 
%	hh         - ���������������� ������� ������
%   prev_scale - ����������� ���������� ���������� �����������

scaleover=10;       % ����� ����� ��� ������������ ����������� ������������
% �������������� �������� � ��������� ��������                          
gain=power(10,0.05*G);    
% ���������� ����������� ������������% ��� ���������������� ������ ��������
scale=gain/(sqrt(sum(h(1:len).^2)/len)+0.01);
% ������������ ��������� ������������� ��� ������ scaleover �����
hh(1:len)=0;
for i=1:(scaleover-1)
    hh(i)=h(i)*((scale*i+prev_scale*(scaleover-i))*(1/scaleover));
end
% ���������� ������� �������
hh(scaleover:len)=h(scaleover:len)*gain;
% ���������� ����������� ����������� ������������
prev_scale=scale;