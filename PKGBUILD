pkgname="secureboot-grub"
_pkgname="secureboot"
pkgver=0.1.0
pkgrel=1
arch=("any")
url="https://github.com/zeroxoneafour/arch-secureboot"
pkgdesc="A set of helper scripts for secure boot with Grub2 and Shim"
license=("MIT")
depends=("openssl" "grub" "shim-signed" "sbsigntools")
source=("$_pkgname::git+https://github.com/zeroxoneafour/arch-secureboot")
sha256sums=("SKIP")

pkgver() {
	cd $_pkgname
	echo $(cat version.txt)
}

build() {
	cd $_pkgname
	bash ./build.sh
}

package() {
	cd $_pkgname
	install -D -m755 "secure-grub-install.sh" "$pkgdir/usr/bin/secure-grub-install"
	install -D -m755 "sign-kernels.sh" "$pkgdir/usr/bin/sign-kernels"
	install -D -m755 "secureboot.conf" "$pkgdir/etc/secureboot.conf"
	for mok_file in $(ls | grep "MOK"); do
		install -D -m644 "$mok_file" "$pkgdir/usr/share/$_pkgname/$mok_file"
	done
	install -D -m644 "91-sign-kernels.hook" "$pkgdir/usr/share/libalpm/hooks/91-sign_kernels.hook"
}
