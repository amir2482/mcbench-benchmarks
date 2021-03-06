function au_qmr_ilu_l_i
%
%  Generates the data used in 'au_qmr_ilu_l'. Data are stored in global
%  variables.
%
%  NOTE that 'au_qmr_ilu_m_i' must be called before calling this routine.
% 
%  Calling sequence:
%
%    au_qmr_ilu_l_i
%
%  Remarks:
% 
%    This routine has access to the matrix A and some other data, which are
%    provided as global data by the routine 'au_qmr_ilu_m_i'.
%
%
%   LYAPACK 1.0 (Thilo Penzl, August 1999)

global LP_A LP_L LP_U LP_TOL_ILU LP_INFO_QMR

if ~length(LP_A) | ~length(LP_TOL_ILU) | ~length(LP_INFO_QMR)
  error('This routine needs global data which must be generated by calling ''au_qmr_ilu_m_i'' first.');
end 

[LP_L,LP_U] = luinc(LP_A,LP_TOL_ILU);

if LP_INFO_QMR>=5
  nnA = nnz(LP_A);
  nnLU = nnz(LP_L)+nnz(LP_U);
  disp(sprintf('ILU-Ratio (nnz(L)+nnz(U))/nnz(A) = %6g',nnLU/nnA)); 
end



