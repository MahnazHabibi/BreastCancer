
"A Novel Machine Learning Method for Mutational Analysis to Identifying Driver Genes in Breast Cancer"

Corresponding author: Golnaz Taheri (Email: golnazt@kth.se), Mahnaz Habibi (Email: Mahnaz.Habibi@iau.ac.ir)

=======================================================================

# Structure Preserving Nonnegative Feature Self-Representation (SPNFSR).

Version 1.0

If you want to calculate the score values for each feature in the new dataset, please prepare your input file in the "Genes.mat" format in MATLAB.

For example, "All_Features=[x_ij]" represents the feature matrix where x_ij represents the j-th feature of the i-th sample.


You can calculate feature matrix related topological and biological features for mutated genes using the following arguments in the MATLAB command line:

load('Genes.mat')
[All_Features]=Feature_Matrix(Gene);


==============

The entry point of the code is the script SPNFSR.m

To run the program, use the following arguments in the MATLAB command line:

"SPNFSR_Score = SPNFSR(k,N,W_initial,Alpha,Beta, All_Features);"

You can also specify k > 0 and N > 0 values.

W_initial is defined randomly as a matrix (n*n).

You can define the alpha and beta values between 0 and 10.

The output file is "SPNFSR_Score" and contains the score value for each feature.

=================================================================

#. Monte Carlo algorithm for breast cancer driver module (MC-BCM ).

Version 1.0

The entry point of the code is the script MC_BCM.m

To run the program, use the following arguments in the MATLAB command line:

"[Clusters] = MC_BCM(PPI,T_low,T,k,N);"

You can also specify 4 < k < 10 and N > 0 values.

You can define the T_low= 0.01 and T = 10000.

PPI is defined as a adjacency matrix (n*n) of Breast Cancer Network.


