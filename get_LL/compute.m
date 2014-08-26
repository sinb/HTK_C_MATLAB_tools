tiantianCUT_lpcce_norm_LL = [];

for i = 301:1:414
data = tiantianCUTlpcce_norml{1,i}';
loglik = ...
    mhmm_logprob(data, prior1, transmat1, mu1, sigma1, mixmat);
tiantianCUT_lpcce_norm_LL = [tiantianCUT_lpcce_norm_LL loglik];

end

figure, plot(1:114, tiantianCUT_lpcce_norm_LL, 'or')
hold on 
huahua_lpcce_norm_LL = [];
for i = 1:1:449
data = huahua_449_lpcce{1,i}';
loglik = ...
    mhmm_logprob(data, prior1, transmat1, mu1, sigma1, mixmat);
huahua_lpcce_norm_LL = [huahua_lpcce_norm_LL loglik];

end

 plot(1:449, huahua_lpcce_norm_LL, '.k')
