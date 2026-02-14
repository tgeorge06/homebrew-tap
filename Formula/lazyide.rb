class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.2.2/lazyide-macos-aarch64.tar.gz"
      sha256 "c5476c3e14b570b7782d50176afa7ddf80c1701ed319b4bf593efb7037fb3299"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.2.2/lazyide-macos-x86_64.tar.gz"
      sha256 "f284df01df95887c801a26b98fc19816726374bb4a19d0b6d129dd7f3c0e3a24"
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
