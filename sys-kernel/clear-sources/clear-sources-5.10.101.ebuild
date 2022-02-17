# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="108"
CLEAR_VER="${PV}-52"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="amd64 x86"
HOMEPAGE="https://github.com/clearlinux-pkgs/linux-lts2020"
IUSE="experimental"

DESCRIPTION="Clear Linux sources including Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"

CLEAR_URI="https://github.com/clearlinux-pkgs/linux-lts2020/archive/refs/tags/${CLEAR_VER}.tar.gz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CLEAR_URI}"
CLEAR_PATCHDIR="${WORKDIR}/linux-lts2020-${CLEAR_VER}"

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
	"${CLEAR_PATCHDIR}"/0110-give-rdrand-some-credit.patch
	"${CLEAR_PATCHDIR}"/0111-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch
	"${CLEAR_PATCHDIR}"/0112-kernel-time-reduce-ntp-wakeups.patch
	"${CLEAR_PATCHDIR}"/0113-init-wait-for-partition-and-retry-scan.patch
	"${CLEAR_PATCHDIR}"/0114-print-fsync-count-for-bootchart.patch
	"${CLEAR_PATCHDIR}"/0115-add-boot-option-to-allow-unsigned-modules.patch
	"${CLEAR_PATCHDIR}"/0116-enable-stateless-firmware-loading.patch
	"${CLEAR_PATCHDIR}"/0117-migrate-some-systemd-defaults-to-the-kernel-defaults.patch
	"${CLEAR_PATCHDIR}"/0118-xattr-allow-setting-user.-attributes-on-symlinks-by-.patch
	"${CLEAR_PATCHDIR}"/0119-add-scheduler-turbo3-patch.patch
	"${CLEAR_PATCHDIR}"/0120-use-lfence-instead-of-rep-and-nop.patch
	"${CLEAR_PATCHDIR}"/0121-do-accept-in-LIFO-order-for-cache-efficiency.patch
	"${CLEAR_PATCHDIR}"/0122-locking-rwsem-spin-faster.patch
	"${CLEAR_PATCHDIR}"/0123-ata-libahci-ignore-staggered-spin-up.patch
	"${CLEAR_PATCHDIR}"/0124-print-CPU-that-faults.patch
	"${CLEAR_PATCHDIR}"/0125-x86-microcode-Force-update-a-uCode-even-if-the-rev-i.patch
	"${CLEAR_PATCHDIR}"/0126-x86-microcode-echo-2-reload-to-force-load-ucode.patch
	"${CLEAR_PATCHDIR}"/0127-fix-bug-in-ucode-force-reload-revision-check.patch
	"${CLEAR_PATCHDIR}"/0128-nvme-workaround.patch
	"${CLEAR_PATCHDIR}"/0129-don-t-report-an-error-if-PowerClamp-run-on-other-CPU.patch
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
