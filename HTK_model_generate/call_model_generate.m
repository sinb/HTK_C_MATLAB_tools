foldernames = '/home/sinb/Programming/matlabworks/MyASRTools/HTK_model_generate/t_aeio_nosil/t_aeio_nosil_lpcce/model/proto'
states = 8;
mixes = 5;
word = 'tiantian';
type = 'lpcce';
lpccemodelgenerate(foldernames,states,mixes,word,type)

foldernames = '/home/sinb/Programming/matlabworks/MyASRTools/HTK_model_generate/t_aeio_nosil/t_aeio_nosil_mfcce/model/proto'
states = 8;
mixes = 5;
word = 'tiantian';
type = 'mfcce';
mfccemodelgenerate(foldernames,states,mixes,word,type)