# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_GENPATCHES_VER="122"
CLEAR_VER="${PV/_p/-}"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Clear Linux sources including Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://github.com/clearlinux-pkgs/linux-ltsprev"
CLEAR_URI="https://github.com/clearlinux-pkgs/linux-ltsprev/archive/refs/tags/${CLEAR_VER}.tar.gz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CLEAR_URI}"
KEYWORDS="amd64 x86"
IUSE="experimental"

CLEAR_PATCHDIR="${WORKDIR}/linux-ltsprev-${CLEAR_VER}"

UNIPATCH_STRICTORDER=1
UNIPATCH_LIST="
	"${CLEAR_PATCHDIR}"/0101-i8042-decrease-debug-message-level-to-info.patch
	"${CLEAR_PATCHDIR}"/0102-increase-the-ext4-default-commit-age.patch
	"${CLEAR_PATCHDIR}"/0103-silence-rapl.patch
	"${CLEAR_PATCHDIR}"/0104-pci-pme-wakeups.patch
	"${CLEAR_PATCHDIR}"/0105-ksm-wakeups.patch
	"${CLEAR_PATCHDIR}"/0106-intel_idle-tweak-cpuidle-cstates.patch
	"${CLEAR_PATCHDIR}"/0107-bootstats-add-printk-s-to-measure-boot-time-in-more-.patch
	"${CLEAR_PATCHDIR}"/0108-smpboot-reuse-timer-calibration.patch
	"${CLEAR_PATCHDIR}"/0109-initialize-ata-before-graphics.patch
	"${CLEAR_PATCHDIR}"/0111-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch
	"${CLEAR_PATCHDIR}"/0112-init-wait-for-partition-and-retry-scan.patch
	"${CLEAR_PATCHDIR}"/0114-add-boot-option-to-allow-unsigned-modules.patch
	"${CLEAR_PATCHDIR}"/0115-enable-stateless-firmware-loading.patch
	"${CLEAR_PATCHDIR}"/0116-migrate-some-systemd-defaults-to-the-kernel-defaults.patch
	"${CLEAR_PATCHDIR}"/0117-xattr-allow-setting-user.-attributes-on-symlinks-by-.patch
	"${CLEAR_PATCHDIR}"/0119-use-lfence-instead-of-rep-and-nop.patch
	"${CLEAR_PATCHDIR}"/0120-do-accept-in-LIFO-order-for-cache-efficiency.patch
	"${CLEAR_PATCHDIR}"/0121-locking-rwsem-spin-faster.patch
	"${CLEAR_PATCHDIR}"/0122-ata-libahci-ignore-staggered-spin-up.patch
	"${CLEAR_PATCHDIR}"/0123-print-CPU-that-faults.patch
	"${CLEAR_PATCHDIR}"/0124-x86-microcode-Add-an-option-to-reload-microcode-even.patch
	"${CLEAR_PATCHDIR}"/0125-nvme-workaround.patch
	"${CLEAR_PATCHDIR}"/0126-don-t-report-an-error-if-PowerClamp-run-on-other-CPU.patch
	"${CLEAR_PATCHDIR}"/0127-lib-raid6-add-patch.patch
	"${CLEAR_PATCHDIR}"/0128-itmt_epb-use-epb-to-scale-itmt.patch
	"${CLEAR_PATCHDIR}"/0130-itmt2-ADL-fixes.patch
	"${CLEAR_PATCHDIR}"/0131-add-a-per-cpu-minimum-high-watermark-an-tune-batch-s.patch
	"${CLEAR_PATCHDIR}"/0133-novector.patch
	"${CLEAR_PATCHDIR}"/0134-md-raid6-algorithms-scale-test-duration-for-speedier.patch
	"${CLEAR_PATCHDIR}"/0135-initcall-only-print-non-zero-initcall-debug-to-speed.patch
	"${CLEAR_PATCHDIR}"/scale.patch
	"${CLEAR_PATCHDIR}"/libsgrowdown.patch
	"${CLEAR_PATCHDIR}"/kdf-boottime.patch
	"${CLEAR_PATCHDIR}"/adlrdt.patch
	"${CLEAR_PATCHDIR}"/kvm-printk.patch
	"${CLEAR_PATCHDIR}"/epp-retune.patch
	"${CLEAR_PATCHDIR}"/tcptuning.patch
	"${CLEAR_PATCHDIR}"/0001-powerbump-functionality.patch
	"${CLEAR_PATCHDIR}"/0002-add-networking-support-for-powerbump.patch
	"${CLEAR_PATCHDIR}"/0003-futex-bump.patch
	"${CLEAR_PATCHDIR}"/0001-add-umonitor-umwait-C0.x-C-states.patch
	"${CLEAR_PATCHDIR}"/0001-mm-memcontrol-add-some-branch-hints-based-on-gcov-an.patch
	"${CLEAR_PATCHDIR}"/0002-sched-core-add-some-branch-hints-based-on-gcov-analy.patch
	"${CLEAR_PATCHDIR}"/netscale.patch
	"${CLEAR_PATCHDIR}"/sched-hybrid1.patch
	"${CLEAR_PATCHDIR}"/sched-hybrid3.patch
	"${CLEAR_PATCHDIR}"/sched-hybrid4.patch
	"${CLEAR_PATCHDIR}"/0001-sched-migrate.patch
	"${CLEAR_PATCHDIR}"/0002-sched-migrate.patch
"

src_unpack() {
	unpack "${CLEAR_VER}.tar.gz"
	kernel-2_src_unpack
	tail +24 "${CLEAR_PATCHDIR}/config" > "${S}/arch/x86/configs/clear.config"
	rm -rf "${CLEAR_PATCHDIR}"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "The default Clear Linux configuration is installed as a fragment."
	einfo "If you want to use it, run \"make defconfig clear.config\"."
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
