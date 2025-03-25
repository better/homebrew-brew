class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.52.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "5b83310ea77b270b67fc9756b88158a1bfc01a5a75ccf0f9e00bdb6aa80ce25d"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "cf31be7cd07d4a34e04fea678314e914bbe1f64601b0621d00277d68c100f1af"
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
