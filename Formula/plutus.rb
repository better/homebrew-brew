class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.42.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "657c7b94e82a4587da5318694f51e6ed3d119d46eb347c0177bc8e447d60f157"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "e3a2f0290dfd2ead585a704ad78bcfb7a6fe2fcaabfa6762a20e59f79845a917"
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
