class SagittariusScheme < Formula
  desc "Free Scheme implementation supporting R6RS and R7RS"
  homepage "https://bitbucket.org/ktakashi/sagittarius-scheme/wiki/Home"
  url "https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/sagittarius-0.9.7.tar.gz"
  sha256 "a8517ef342aadf9fb964e03fd03d4eb13287e5686406ba60d93d6e5c9c91f2a2"
  license "BSD-2-Clause"

  bottle do
    cellar :any
    sha256 "83845fdb59150a6c1bdd0e7f4fae012cf61179d66bb4187ab02cf8916230adbb" => :catalina
    sha256 "c49cdba71567af4f9ba0a65abd81cd60f7913afc614d5f2495fb5f10961c8a53" => :mojave
    sha256 "5c49ae9b83d175b6d65dab8ce262b4fd3a99d6bc6b8306da963054ade9f5ff3e" => :high_sierra
  end

  depends_on "cmake" => :build
  depends_on "bdw-gc"
  depends_on "libffi"
  depends_on "openssl@1.1"
  depends_on "unixodbc"

  def install
    system "cmake", ".", *std_cmake_args, "-DODBC_LIBRARIES=odbc"
    system "make", "install"
  end

  test do
    assert_equal "4", shell_output("#{bin}/sagittarius -e '(display (+ 1 3))(exit)'")
  end
end
