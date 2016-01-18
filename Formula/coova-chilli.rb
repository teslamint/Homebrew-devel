class CoovaChilli < Formula
  desc "access controller for captive portal hotspots"
  homepage "https://coova.github.io/CoovaChilli"
  head "https://github.com/coova/coova-chilli.git"

  depends_on "openssl" => :build
  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "gengetopt" => :build

  def install
    inreplace "bootstrap", "libtoolize", "glibtoolize"
    system "./bootstrap"
    args = %W[
      --disable-debug
      --disable-silent-rules
      --prefix=#{prefix}
    ]
    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/chilli", "--help"
  end
end
