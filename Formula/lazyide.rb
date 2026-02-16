class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.2/lazyide-macos-aarch64.tar.gz"
      sha256 "2b3162355e201554c9551f48a5b1cb8134629516501ba9bce8e4ef345e6dae87"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.2/lazyide-macos-x86_64.tar.gz"
      sha256 "08e172ff8a7ac2d2f43f718602e4fe75d8bc2f5492c40555b1456fe776ea5545"
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
