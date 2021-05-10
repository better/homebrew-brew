class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "$PLUTUS_VERSION"

  on_macos do
    url "$MACOS_BIN_URL", :using => :nounzip
    sha256 "$MACOS_BIN_SHA256"
    ${DOLLAR}executable_name = "darwin-x64"
  end
  
  on_linux do
    url "$LINUX_BIN_URL", :using => :nounzip
    sha256 "$LINUX_BIN_SHA256"
    ${DOLLAR}executable_name = "linux-x64"
  end

  def install
    mv ${DOLLAR}executable_name, name
    system "chmod", "+x", name
    libexec.install name
    bin.install_symlink libexec/name
  end

  test do
    system bin/name, "version"
  end
end
