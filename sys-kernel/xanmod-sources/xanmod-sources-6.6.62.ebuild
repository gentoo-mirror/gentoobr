# Copyright 1999-2024 Gentoo Brazilian Community
# Distributed under the terms of the GNU General Public License v2-or-later

EAPI="8"
ETYPE="sources"

K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="70"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"

XANMOD_CHANNEL="lts"
XANMOD_VERSION="1"
XANMOD_URI="https://master.dl.sourceforge.net/project/xanmod/releases/${XANMOD_CHANNEL}"

DESCRIPTION="LTS XanMod kernel sources, including the Gentoo patchset"
HOMEPAGE="https://xanmod.org"

inherit kernel-2
detect_version

_xanpatchfile="patch-${OKV}-xanmod${XANMOD_VERSION}.xz"

SRC_URI="
	${KERNEL_BASE_URI}/linux-${KV_MAJOR}.${KV_MINOR}.tar.xz
	${XANMOD_URI}/${OKV}-xanmod${XANMOD_VERSION}/${_xanpatchfile} -> 2399_${_xanpatchfile}
	${GENPATCHES_URI}"

LICENSE+=" CDDL"
KEYWORDS="~amd64"
RESTRICT="mirror"

UNIPATCH_LIST+="${DISTDIR}/2399_${_xanpatchfile}"

# excluding all minor kernel revision patches; XanMod will take care of that.
UNIPATCH_EXCLUDE+=" 1*_linux-${KV_MAJOR}.${KV_MINOR}.*.patch "

pkg_postinst() {
	elog "The XanMod team strongly suggests the use of updated CPU microcodes with its"
	elog "kernels. For details, see https://wiki.gentoo.org/wiki/Microcode ."
	kernel-2_pkg_postinst
}
