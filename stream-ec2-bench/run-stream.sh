instance_type=$1
num_threads=$2
arr_size=$3

log_file=stream-res-$instance_type-$num_threads-log.txt
summary_file=stream-res-$instance_type-$num_threads-summary.txt

gcc -O -DSTREAM_ARRAY_SIZE=$arr_size -fopenmp -D_OPENMP stream.c -o stream
OMP_NUM_THREADS=$num_threads ./stream >log_file
tail -8 log_file | head -5 >summary_file
