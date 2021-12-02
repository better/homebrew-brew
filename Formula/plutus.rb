class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.19.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "10ecdb3a4505879c3d551318126457ef7dec3d24f654230f039745a72afdb4c1"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "fca040ae93c67ac864ab730b87570fb5577da401b8abdf94d73c067a7ff85bd0"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
