Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD493845A9;
	Fri,  3 Apr 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210802; cv=none; b=fgHBpWA6TILyDH08YoNDtrwQ9B222m/slr5pa9VT8ppt0JjqwtKQLFEwtnkWIHbKAd783iWbctWf01SW2BAFIDazhsHl4f+pSZo245XE/X8X/j4WbskcSbJ/TsDVYmHKlLHqFefob4xKS3lRLn0PKR/X5Fd5CN+KvKcbQyB5msA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210802; c=relaxed/simple;
	bh=duPJZJsVgshUx0ZSuYbiYZ3biXpP3xFSjGnb4lTfNtg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=llE2U4Kd5stoCcFl9MDUV5ahFIEmVhWnQ0KRUgI168c5Ibe1/Fe2KXOOP4FTS48pxmfjGNCqD1g5SeZ4P81/WQcxwN7sjlU9XvomYJPiYtflJirIH4T+W64XoZ8q+vf0GO0WG1dSXKbIofEYSgXSrdtuQ3q0izA5Fx1+xfONGgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [10.213.19.33] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowACHLGgZkc9pk38PDA--.5212S2;
	Fri, 03 Apr 2026 18:06:18 +0800 (CST)
Message-ID: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
Date: Fri, 3 Apr 2026 18:06:17 +0800
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Devicetree spec: Specifying /cpus/cpu@* unit address format?
To: devicetree-spec@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qwCowACHLGgZkc9pk38PDA--.5212S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWUAF15WF18Cr4kJFWUurg_yoW5JrWrpr
	s7uFyUtryqyF48Jw42q3WUX3y3AFWkWw4UtF95J34kAFZ8WFykZFna9wn0gFyUCF1xXa45
	Zws09a4UC3ZrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUgvJmDUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

(Also posted at: https://github.com/devicetree-org/devicetree-specificati=
on/issues/86 )

Hi all,

Presently, there seems to be some confusion in the community about the
format of unit addresses for "/cpus/cpu@*" nodes for a CPU with ID > 9, e=
=2Eg.

=C2=A0 =C2=A0 cpu@??? {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <10>;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* reg =3D <0xa>; */ /* This should be equiva=
lent */
=C2=A0 =C2=A0 }


Should this be a decimal "cpu@10", or hexadecimal "cpu@a"? I can't find
any explicit specification.

  * Most other nodes specify a hex unit address
  * I could not find anything specifying this generically
      o AFAICT, there's no /cpus in IEEE 1275
      o ePAPR doesn't say anything about this
      o Presently, DTSpec doesn't say anything about this.
  * dt-schema says it's ^cpu@[0-9a-f]+$, seemingly intending to use
    hexadecimal, but not forbidding decimal. [1]
  * Of the `/cpus` schemas in Linux
    (Documentation/devicetree/bindings/{arm,mips,riscv,loongarch}/cpus.ya=
ml),
    none mention the node unit address

As of current usage:

  * Of all the DTS files in (mainline) Linux, most either use hex, or
    have reg < 9 for all CPUs.
      o AFAICT from grepping, arm and arm64 consistently uses hex.
      o Most riscv SoCs have <=3D 9 CPUs. The two that don't use decimal:=

        arch/riscv/boot/dts/sophgo/{sg2042,sg2044}-cpus.dtsi
      o No other arch has in-tree DTS with CPU reg > 9
  * Of all the dt-bindings examples in Linux, only one uses decimal, but
    it seems to be unintentional:
    Documentation/devicetree/bindings/opp/opp-v2.yaml
  * QEMU generates decimal for multiple archs in e.g.
    `hw/{arm,riscv}/virt.c` and other places (grep -R "cpu@")
  * Spike (RISC-V emulator) generates decimal [3]

It could be a good idea to have this standardized, like all other unit
addresses.

DTSpec says:

=C2=A0 The binding for a particular bus may specify additional, more spec=
ific
requirements for the format of reg and the unit-address.

Since /cpus and /cpus/cpu@* are generically defined in DTSpec and
specialized for various architectures, I believe this is the right place
to start standardizing this. Even if arch-specific definitions are
required, at least DTSpec can give a recommendation on whether to use
decimal or hexadecimal.

Thanks,
Vivian "dramforever" Wang

[1]: https://github.com/devicetree-org/dt-schema/blob/v2025.12/dtschema/s=
chemas/cpus.yaml#L52-L54
[2]: https://github.com/riscv-software-src/riscv-isa-sim/blob/5eeeb91efa9=
66936ef7b980f5e8dd00ffbe70786/riscv/dts.cc#L61

