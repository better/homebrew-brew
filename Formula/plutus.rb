class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.41.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "2f63002f21f110afed0443475724a6b6fdfbda415720b3b736eaf278eb0d174b"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "a0324cf8e5ec39a858f497a56ba255e81c6a14e606930b2b307efe5c59969636"
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
