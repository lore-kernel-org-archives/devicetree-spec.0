Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C0E2DB7B4;
	Mon,  6 Apr 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486788; cv=none; b=cApj9j+YR/Al5u+qEbNjFuT0KvJuspGwj4RnxKvuQlzZnNbWMniKHKGG3Zt9jia86ng/TKb5pN+cVqwCFpZP/Whz5V3pR2gW+6+P5mN/4GBJJSiombdZiD67q8SKyATS4o0o4wElbun5IPczaSnD8mCPNpxK2Bv60tZx/dUb20E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486788; c=relaxed/simple;
	bh=En2b39jdFS5QMB/Ya52UshE/Amn98guN52WOng8pSGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKAkgAzcBiFqRwupz3RkwR1iWII5IWEwvKsA0igMKohjCHlX7fYr54hRi6cq3YR3gW82IJUA0FutROS8s00TI2lcLHDok5NQ6hhgBWEr4Z3m4dFDUTCzfX7HVfjyXftzEr1gEGRwMhToxSzN3MlZ6+sHFIloW8mPG0J75ozuEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.101] (unknown [123.118.218.47])
	by APP-05 (Coremail) with SMTP id zQCowAAHmQwux9Nps+a1DA--.49435S2;
	Mon, 06 Apr 2026 22:46:07 +0800 (CST)
Message-ID: <3538ad96-1dec-4bfd-9671-d351b385b4be@iscas.ac.cn>
Date: Mon, 6 Apr 2026 22:46:06 +0800
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
To: Rob Herring <robh@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-spec@vger.kernel.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
 <adHofcKAr7C5YCSA@zatzit>
 <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHmQwux9Nps+a1DA--.49435S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr47uFWUKr13Xw45XFWUJwb_yoWkCrX_Wa
	yj9r4DAr1DZay3Kasayr4rZasF9rWrCrZ8X3yUJwsrWa4kXFyDWFn3Gr1kZFn3Aw4jvw1a
	kr98ZF47C3yxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8fpnPUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 4/6/26 20:48, Rob Herring wrote:
> On Sat, Apr 4, 2026 at 11:43 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
>> On Fri, Apr 03, 2026 at 06:06:17PM +0800, Vivian Wang wrote:
>>> (Also posted at: https://github.com/devicetree-org/devicetree-specification/issues/86 )
>>>
>>> Hi all,
>>>
>>> Presently, there seems to be some confusion in the community about the
>>> format of unit addresses for "/cpus/cpu@*" nodes for a CPU with ID > 9, e.g.
>>>
>>>     cpu@??? {
>>>         reg = <10>;
>>>         /* reg = <0xa>; */ /* This should be equivalent */
>>>     }
>>>
>>>
>>> Should this be a decimal "cpu@10", or hexadecimal "cpu@a"? I can't find
>>> any explicit specification.
>> It should be hex.  That's a general convention for unit addresses.
>> Before flattened trees, OF essentially never used decimal
>> representations of things.
> The only decimal usage in FDT were mistakes.

Thanks for this. This is clear enough for me.

> Rather than worrying about what the spec says, please worry about what
> the tools check.

Since, as you two said, there is an established convention, I agree that
convention is enough here.

Thanks,
Vivian "dramforever" Wang

