class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.1/lazyide-macos-aarch64.tar.gz"
      sha256 "9ab4600a0bf05e3471857ce338fe8c94b918944ec4372b57dcfa520a19407efd"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.1/lazyide-macos-x86_64.tar.gz"
      sha256 "aaf8d974999e95e309eeec2f4b15b8cddf81903ba91089193a8e2e25dcb0a38f"
    end
  end

  def install
    bin.install "lazyide"
  end

  def caveats
    <<~EOS
      Optional tools for full functionality:
        brew install ripgrep        # project-wide search (Ctrl+Shift+F)
        rustup component add rust-analyzer  # LSP for Rust files

      Run `lazyide --setup` to check and install missing tools.
    EOS
  end

  test do
    assert_match "Usage: lazyide", shell_output("#{bin}/lazyide --help")
  end
end
