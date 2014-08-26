float modelParameterMean[6][5][13] = {
	{{1.5388,12.0136,13.2853,15.0138,15.0024,15.2398,10.532,8.5997,6.2843,2.6072,1.8838,0.032901,0.0067134}, 
	{-3.7846,7.5955,14.3469,17.5911,6.2137,14.5609,9.6107,7.7097,6.3572,1.3314,2.7202,-0.10271,0.0069593}, 
	{-1.9779,5.4126,6.04,9.8846,7.8838,10.9019,5.5366,5.5541,4.6436,1.5475,1.8563,-0.01797,0.00075213}, 
	{2.6642,9.7699,10.1606,16.0301,-0.3333,7.762,2.8874,6.582,4.6923,1.4398,1.6845,0.081431,0.0071329}, 
	{-4.8401,1.3087,1.2508,4.7063,2.5922,7.0363,1.6569,2.6001,2.9214,0.21661,1.6811,-0.12161,4.7913e-05}
	},
{{-1.6606,5.99,8.5534,11.8651,-7.6284,3.839,-0.65656,2.4676,2.8876,-0.67827,1.987,-0.056495,0.0011116}, 
	{-7.9808,1.9945,8.6448,11.8815,-0.81534,9.3672,4.9258,4.8369,4.758,-0.00067176,2.7601,-0.1292,0.00082628}, 
	{1.8607,4.1697,3.8833,17.6781,-8.4472,5.0766,0.1048,7.2005,5.0567,2.0698,1.1028,-0.1613,0.0049006}, 
	{1.9911,7.4275,4.1786,9.3392,-7.5505,0.45917,-4.6576,2.4363,1.9027,0.18877,1.2722,0.092959,0.0011242}, 
	{-0.54681,-0.39488,-1.5728,12.9563,-14.5865,3.2798,-2.8866,5.3971,4.3779,-0.12008,0.65518,-0.16103,0.0027926}
	},
{{-8.3896,-0.79176,2.3489,4.4869,-6.6035,2.0957,-1.3242,0.53192,1.5265,-1.5045,1.7404,-0.26665,0.00066996}, 
	{-2.0736,2.9023,0.97213,4.8993,-12.6746,-3.6184,-8.4507,-1.5402,-0.41453,-2.2911,0.53946,-0.33034,0.00072744}, 
	{-2.0674,-2.6106,-4.3897,10.338,-19.7889,-4.6833,-9.005,1.678,1.1265,-1.0087,-0.19055,-0.48084,0.003396}, 
	{0.58658,-3.3618,-5.901,17.8648,-16.683,2.7762,-3.683,5.7175,4.5342,3.2727,0.10633,-0.3809,0.034745}, 
	{-6.7967,-5.9623,-4.9493,8.7778,-24.7983,-7.091,-11.1626,1.336,2.4449,-2.5018,-0.14531,-0.46816,0.14159}
	},
{{-0.46252,3.7987,1.9544,9.0838,0.31887,6.9703,0.82043,4.8352,4.4521,1.7748,1.2664,-0.25036,0.00032892}, 
	{-4.6061,-4.5807,-5.015,6.6421,-20.6807,3.2701,-4.8369,1.7244,2.5989,-4.4322,0.41378,-0.33636,0.0033652}, 
	{-1.1323,-6.2638,-11.542,9.5981,-18.0276,-0.19365,-7.7464,1.1138,0.04622,0.13364,-1.0499,-0.90666,0.0055858}, 
	{-3.6073,-11.2729,-16.1271,8.55,-22.2848,2.3066,-8.6663,1.7407,1.502,-1.8426,-0.3631,-0.56806,0.037857}, 
	{-7.7963,-13.5019,-16.2277,7.2974,-20.4842,-0.90583,-9.8738,0.30296,2.6437,-0.38814,-1.0031,-0.69972,0.51646}
	},
{{-1.701,2.6293,-0.3185,4.042,-3.5522,2.246,-3.6884,0.87812,1.8219,-0.24074,0.74688,-0.3179,6.7176e-05}, 
	{-2.2997,1.4318,-1.8937,2.6234,-6.2406,-0.44235,-7.2837,-2.5008,-0.69191,-1.8935,-0.14986,-0.60229,0.00010787}, 
	{-1.7492,-1.2486,-5.7353,4.547,-8.6725,1.7155,-4.6456,1.8823,1.7493,0.28603,0.18444,-0.5285,0.00033832}, 
	{-1.8419,-2.2367,-8.2272,2.0735,-12.2334,-1.183,-10.2778,-1.9284,0.1548,-1.6459,-0.53371,-0.64438,0.00089549}, 
	{-3.6433,-7.7054,-13.2268,4.3835,-11.7751,4.7271,-6.1598,1.5254,1.0602,-1.215,-0.059976,-0.35933,0.0019354}
	},
{{-4.2646,2.6208,2.758,4.7253,2.1892,6.2108,1.6957,2.7982,3.222,0.12741,1.5716,-0.17761,2.3729e-05}, 
	{-5.4491,-0.48985,-1.4529,2.6801,0.30926,5.0635,0.17406,2.2352,2.5897,0.1495,1.3994,-0.20877,2.2283e-05}, 
	{-5.1554,0.78272,-0.059539,1.8425,-1.0161,2.6825,-2.079,-0.34831,0.93897,-0.9593,1.0522,-0.29636,2.4574e-05}, 
	{-6.3214,-2.6075,-4.2656,1.1497,-2.2683,3.1567,-2.2596,0.87546,1.6284,-0.29605,1.0863,-0.28076,4.9e-05}, 
	{-6.0283,-1.9677,-4.0458,-0.36579,-3.9781,0.64512,-4.8331,-1.9398,-0.47437,-1.7183,0.47665,-0.44793,3.859e-05}
	}
};
	float modelParameterVar[6][5][13] = {
	{{3.5889,15.4302,14.7106,4.769,12.6739,6.0148,5.8447,2.7443,1.5016,1.0141,0.39297,0.062054,3.5667e-05}, 
	{8.8396,5.8724,9.9303,17.8225,22.1506,13.0554,8.2553,9.3797,5.3909,2.0451,0.88844,0.084923,3.5667e-05}, 
	{2.2429,3.0746,5.0584,6.0818,5.8243,6.1156,3.7752,2.4588,1.9538,1.1964,0.47159,0.053723,3.5667e-05}, 
	{5.0226,9.083,14.469,19.7247,43.2904,11.9034,9.8142,9.384,6.378,4.8196,0.87963,0.11126,3.5667e-05}, 
	{2.9702,4.2915,7.5883,9.0004,9.1998,7.688,5.6686,4.1172,2.7765,1.5581,0.49999,0.059675,3.5667e-05}
	},
{{6.0039,6.3665,8.4609,18.8531,52.584,11.7476,8.4961,8.3677,5.7176,3.6213,0.87198,0.094099,3.5667e-05}, 
	{11.1218,7.3538,11.8812,26.1635,21.9053,12.541,6.9951,8.9882,5.9789,2.5114,0.95709,0.10044,3.5667e-05}, 
	{3.8388,3.5971,9.2275,25.8998,30.6286,17.2927,12.1008,9.2227,7.2231,7.7689,1.0798,0.13242,3.5667e-05}, 
	{6.4543,7.8644,9.4249,16.0447,28.6821,13.9258,9.433,10.5855,8.0321,3.7801,1.1534,0.13976,3.5667e-05}, 
	{5.7092,6.2475,12.8898,25.9289,31.9236,27.6408,13.4878,11.0608,8.798,7.9774,1.4667,0.13965,3.5667e-05}
	},
{{14.0481,7.6257,15.9964,23.5509,29.4745,13.9829,8.833,8.8168,6.1361,2.9368,1.1117,0.11659,3.5667e-05}, 
	{10.6404,6.9364,12.6085,20.9961,35.9047,13.4223,13.9621,8.5124,7.9695,4.6934,1.53,0.17977,3.5667e-05}, 
	{7.3116,6.4355,11.7435,28.35,30.1464,17.5341,11.9357,10.1974,7.2953,8.8886,1.889,0.1838,3.5667e-05}, 
	{9.6563,10.5174,22.0374,23.0198,47.1381,42.7953,23.9439,11.9014,8.6526,4.1654,1.5489,0.097522,0.00054566}, 
	{21.2923,13.9935,37.3136,63.192,106.3428,27.0516,25.9307,19.3801,10.1023,14.1206,3.1439,0.22724,0.046358}
	},
{{4.2247,3.9129,7.4619,9.2194,14.8782,11.1548,8.3679,5.0922,3.822,3.0112,0.72506,0.096299,3.5667e-05}, 
	{7.92,7.231,15.8425,28.7853,57.6093,36.243,18.766,17.3701,10.724,5.0979,2.382,0.1661,3.5667e-05}, 
	{5.2979,4.3162,7.3325,17.3478,21.3591,24.1975,13.1608,12.7112,7.4333,8.5018,2.7018,0.13039,3.5667e-05}, 
	{7.0778,6.403,16.4844,26.4589,30.8297,33.4306,21.6196,15.5664,12.096,14.518,2.2745,0.18049,0.00085479}, 
	{14.4425,5.9872,19.578,38.0485,41.4679,43.3786,14.4546,15.0309,10.5584,7.4188,2.5418,0.095968,0.12507}
	},
{{2.3805,2.6715,5.1743,10.1059,11.536,8.0607,8.2855,5.596,3.8384,2.7881,0.901,0.12977,3.5667e-05}, 
	{3.6245,3.1464,5.4734,9.6171,14.3935,7.0134,6.359,3.9702,3.9517,2.6821,0.87586,0.15552,3.5667e-05}, 
	{3.4187,3.0854,6.5099,17.7397,18.7335,14.142,9.2503,6.7786,5.2722,4.1954,1.1298,0.17356,3.5667e-05}, 
	{6.6201,4.6999,10.1421,14.7623,17.9519,12.1482,13.2691,7.9792,8.8827,4.8676,1.5717,0.20128,3.5667e-05}, 
	{8.6936,6.4652,12.3788,16.824,27.3542,21.2769,14.6154,8.6871,8.23,5.6057,1.0835,0.14921,3.5667e-05}
	},
{{2.4399,2.1894,3.7886,7.0767,6.6216,6.4599,4.849,3.5419,2.21,1.3365,0.4772,0.053688,3.5667e-05}, 
	{2.0305,1.4571,3.1234,5.6103,5.8695,4.8682,3.7513,2.6325,1.9309,1.2765,0.46893,0.057628,3.5667e-05}, 
	{2.3394,1.928,3.6114,6.1531,6.3004,5.3825,4.0331,2.4404,1.937,1.326,0.51864,0.078898,3.5667e-05}, 
	{4.2518,2.6579,5.4908,10.1311,8.1636,6.8948,5.1004,3.5003,2.532,1.7504,0.61007,0.076208,3.5667e-05}, 
	{3.2777,3.3378,6.6906,7.4829,8.2614,7.0631,4.6403,2.9213,2.2151,1.6018,0.54766,0.076323,3.5667e-05}
	}
};