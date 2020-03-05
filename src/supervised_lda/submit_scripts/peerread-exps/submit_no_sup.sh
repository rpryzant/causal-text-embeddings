#!/usr/bin/env bash
BASE_OUT=/proj/sml_netapp/projects/causal-text/PeerRead/supervised_lda_baseline/out/

export DIR=/proj/sml_netapp/projects/causal-text/PeerRead/supervised_lda_baseline/proc/
export SIMDIR=/proj/sml_netapp/projects/causal-text/sim/peerread_buzzytitle_based/

export MODE=simple
export LINOUTCOME=t
export RECONLOSS=t
export SUPLOSS=f

declare -a BETA1S=(5.0)

for BETA1j in "${BETA1S[@]}"; do
	for SPLITi in $(seq 0 9); do
	    export BETA1=${BETA1j}
	    export SPLIT=${SPLITi}
	    export OUT=${BASE_OUT}/no_sup/
	    sbatch --job-name=peerread_supervised_lda_sim_${BETA1j}_${SPLITi} \
	           --output=peerread_supervised_lda_sim_${BETA1j}_${SPLITi}.out \
	           supervised_lda/submit_scripts/peerread-exps/run_peerread_simulation.sh
	done
done
