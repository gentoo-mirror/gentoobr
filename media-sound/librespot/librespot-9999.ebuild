# Copyright 2024 Brazilian Gentoo Community
# Distributed under the terms of the GNU General Public License v2-or-later

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

inherit cargo

DESCRIPTION="An open source client library for Spotify, with support for Spotify Connect"

HOMEPAGE="https://github.com/librespot-org/librespot"

if [[ $PV == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
else
	CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aes@0.8.3
	aho-corasick@1.1.2
	alsa@0.7.1
	alsa@0.8.1
	alsa-sys@0.3.1
	anyhow@1.0.75
	arrayvec@0.7.4
	async-trait@0.1.74
	atomic_refcell@0.1.13
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.5
	base64ct@1.6.0
	bindgen@0.68.1
	bitflags@1.3.2
	bitflags@2.4.1
	block-buffer@0.10.4
	bumpalo@3.14.0
	bytemuck@1.14.0
	byteorder@1.5.0
	bytes@1.5.0
	cc@1.0.83
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-expr@0.15.5
	cfg-if@1.0.0
	cipher@0.4.4
	clang-sys@1.6.1
	combine@4.6.6
	const-oid@0.9.5
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	coreaudio-rs@0.11.3
	coreaudio-sys@0.2.13
	cpal@0.15.2
	cpufeatures@0.2.11
	crypto-common@0.1.6
	ct-logs@0.8.0
	ctr@0.9.2
	dasp_sample@0.11.0
	data-encoding@2.5.0
	der@0.7.8
	deranged@0.3.9
	digest@0.10.7
	dns-sd@0.1.3
	either@1.9.0
	encoding_rs@0.8.33
	env_logger@0.10.1
	equivalent@1.0.1
	errno@0.3.6
	fastrand@2.0.1
	fixedbitset@0.4.2
	fnv@1.0.7
	form_urlencoded@1.2.0
	futures@0.3.29
	futures-channel@0.3.29
	futures-core@0.3.29
	futures-executor@0.3.29
	futures-io@0.3.29
	futures-macro@0.3.29
	futures-sink@0.3.29
	futures-task@0.3.29
	futures-timer@3.0.2
	futures-util@0.3.29
	generic-array@0.14.7
	getopts@0.2.21
	getrandom@0.2.11
	gimli@0.28.0
	gio-sys@0.18.1
	glib@0.18.3
	glib-macros@0.18.3
	glib-sys@0.18.1
	glob@0.3.1
	gobject-sys@0.18.0
	governor@0.6.0
	gstreamer@0.21.2
	gstreamer-app@0.21.2
	gstreamer-app-sys@0.21.1
	gstreamer-audio@0.21.2
	gstreamer-audio-sys@0.21.1
	gstreamer-base@0.21.2
	gstreamer-base-sys@0.21.1
	gstreamer-sys@0.21.2
	h2@0.3.24
	hashbrown@0.12.3
	hashbrown@0.14.2
	headers@0.3.9
	headers-core@0.2.0
	heck@0.4.1
	hermit-abi@0.3.3
	hex@0.4.3
	hmac@0.12.1
	home@0.5.5
	hostname@0.3.1
	http@0.2.11
	http-body@0.4.5
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper@0.14.27
	hyper-proxy@0.9.1
	hyper-rustls@0.22.1
	hyper-rustls@0.24.2
	idna@0.4.0
	if-addrs@0.7.0
	indexmap@1.9.3
	indexmap@2.1.0
	inout@0.1.3
	is-terminal@0.4.9
	itertools@0.11.0
	itoa@1.0.9
	jack@0.11.4
	jack-sys@0.5.1
	jni@0.19.0
	jni@0.20.0
	jni-sys@0.3.0
	jobserver@0.1.27
	js-sys@0.3.65
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.150
	libloading@0.7.4
	libm@0.2.8
	libmdns@0.7.5
	libpulse-binding@2.28.1
	libpulse-simple-binding@2.28.1
	libpulse-simple-sys@1.21.1
	libpulse-sys@1.21.0
	linux-raw-sys@0.4.11
	lock_api@0.4.11
	log@0.4.20
	mach2@0.4.1
	match_cfg@0.1.0
	memchr@2.6.4
	memoffset@0.6.5
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.9
	muldiv@1.0.1
	multimap@0.8.3
	ndk@0.7.0
	ndk-context@0.1.1
	ndk-sys@0.4.1+23.1.7779620
	nix@0.23.2
	nix@0.24.3
	nix@0.26.4
	no-std-compat@0.4.1
	nom@7.1.3
	nonzero_ext@0.3.0
	ntapi@0.4.1
	num-bigint@0.4.4
	num-bigint-dig@0.8.4
	num-derive@0.3.3
	num-derive@0.4.1
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.4.1
	num-traits@0.2.17
	num_cpus@1.16.0
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.6
	object@0.32.1
	oboe@0.5.0
	oboe-sys@0.5.0
	ogg@0.9.0
	once_cell@1.18.0
	openssl-probe@0.1.5
	option-operations@0.5.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	pbkdf2@0.12.2
	peeking_take_while@0.1.2
	pem-rfc7468@0.7.0
	percent-encoding@2.3.0
	petgraph@0.6.4
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.27
	portaudio-rs@0.3.2
	portaudio-sys@0.1.1
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	pretty-hex@0.3.0
	priority-queue@1.3.2
	proc-macro-crate@1.3.1
	proc-macro-crate@2.0.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.69
	protobuf@3.3.0
	protobuf-codegen@3.3.0
	protobuf-parse@3.3.0
	protobuf-support@3.3.0
	quick-xml@0.31.0
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	raw-window-handle@0.5.2
	redox_syscall@0.4.1
	regex@1.10.2
	regex-automata@0.4.3
	regex-syntax@0.8.2
	ring@0.16.20
	ring@0.17.5
	rodio@0.17.3
	rpassword@7.3.1
	rsa@0.9.3
	rtoolbox@0.0.2
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.38.24
	rustls@0.19.1
	rustls@0.21.8
	rustls-native-certs@0.5.0
	rustls-native-certs@0.6.3
	rustls-pemfile@1.0.4
	rustls-webpki@0.101.7
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	schannel@0.1.22
	scopeguard@1.2.0
	sct@0.6.1
	sct@0.7.1
	sdl2@0.35.2
	sdl2-sys@0.35.2
	security-framework@2.9.2
	security-framework-sys@2.9.1
	serde@1.0.192
	serde_derive@1.0.192
	serde_json@1.0.108
	serde_spanned@0.6.4
	sha1@0.10.6
	shannon@0.2.0
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook-registry@1.4.1
	signature@2.2.0
	slab@0.4.9
	smallvec@1.11.2
	socket2@0.4.10
	socket2@0.5.5
	spin@0.5.2
	spin@0.9.8
	spki@0.7.2
	subtle@2.5.0
	symphonia@0.5.3
	symphonia-bundle-mp3@0.5.3
	symphonia-codec-vorbis@0.5.3
	symphonia-core@0.5.3
	symphonia-format-ogg@0.5.3
	symphonia-metadata@0.5.3
	symphonia-utils-xiph@0.5.3
	syn@1.0.109
	syn@2.0.39
	sysinfo@0.29.10
	system-deps@6.2.0
	target-lexicon@0.12.12
	tempfile@3.8.1
	termcolor@1.4.0
	thiserror@1.0.50
	thiserror-impl@1.0.50
	thread-id@4.2.1
	time@0.3.30
	time-core@0.1.2
	time-macros@0.2.15
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.34.0
	tokio-macros@2.2.0
	tokio-rustls@0.22.0
	tokio-rustls@0.24.1
	tokio-stream@0.1.14
	tokio-tungstenite@0.20.1
	tokio-util@0.7.10
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.20.7
	toml_edit@0.21.0
	tower-service@0.3.2
	tracing@0.1.40
	tracing-core@0.1.32
	try-lock@0.2.4
	tungstenite@0.20.1
	typenum@1.17.0
	unicode-bidi@0.3.13
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-width@0.1.11
	untrusted@0.7.1
	untrusted@0.9.0
	url@2.4.1
	utf-8@0.7.6
	uuid@1.5.0
	vergen@8.2.6
	version-compare@0.1.1
	version_check@0.9.4
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.88
	wasm-bindgen-backend@0.2.88
	wasm-bindgen-futures@0.4.38
	wasm-bindgen-macro@0.2.88
	wasm-bindgen-macro-support@0.2.88
	wasm-bindgen-shared@0.2.88
	web-sys@0.3.65
	webpki@0.21.4
	webpki@0.22.4
	which@4.4.2
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.46.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	winnow@0.5.19
	zerocopy@0.7.31
	zerocopy-derive@0.7.31
	zeroize@1.6.0"

	SRC_URI="${CARGO_CRATE_URIS}"
fi

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 ISC LGPL-3 MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
IUSE="+alsa pulseaudio -portaudio -sdl -gstreamer jack -rodio -jack-on-rodio"
REQUIRED_USE="jack-on-rodio? ( jack rodio )"
#DEPEND="alsa-lib libsdl2 pulseaudio libpulse jack-audio-connection-kit" # depending on flags, TODO
RDEPEND="${DEPEND}"
BDEPEND="|| ( >=dev-lang/rust-1.78.0 >=dev-lang/rust-bin-1.78.0 )"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_unpack() {
	if [[ $PV = "9999" ]]; then
		git-r3_fetch "${EGIT_REPO_URI}" 'HEAD'
		git-r3_checkout
		cargo_live_src_unpack
	fi
}

src_configure() {
	local myfeatures=(
		$(usev alsa 'alsa-backend')
		$(usev pulseaudio 'pulseaudio-backend')
		$(usev portaudio 'portaudio-backend')
		$(usev sdl 'sdl-backend')
		$(usev gstreamer 'gstreamer-backend')
		$(usev jack 'jackaudio-backend')
		$(usev rodio 'rodio-backend')
		$(usev jack-on-rodio 'rodiojack-backend')
	)
	cargo_src_configure --no-default-features
}
